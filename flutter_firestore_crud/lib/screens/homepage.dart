import 'package:flutter/material.dart';
import 'package:flutter_firestore/model/student.dart';
import 'package:flutter_firestore/screens/add_student.dart';
import 'package:flutter_firestore/screens/detail_student.dart';
import 'package:flutter_firestore/screens/edit_student.dart';
import 'package:flutter_firestore/services/firestore_service.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirestoreService().getStudents(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.hasError || !snapshot.hasData)
              return CircularProgressIndicator();
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Student student = snapshot.data[index];
                return ListTile(
                  title: Text(
                    student.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(student.subject),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditStudent(student: student,)));
                                      print(student.name);
                        },
                      ),
                      IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          print(student.id);
                          _deleteStudent(context, student.id);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentDetail(
                                  name: student.name,
                                  subject: student.subject,
                                )));
                    print(student.name);
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddStudent()));
        },
      ),
    );
  }

  void _deleteStudent(BuildContext context, String id) async {
    if (await _showDialogDelete(context)) {
      try {
        await FirestoreService().deleteStudent(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showDialogDelete(BuildContext context) async {
    return showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: Text("Are you sure you want to delete?"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            textColor: Colors.red,
            child: Text("Delete"),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }
}
