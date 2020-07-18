import 'package:flutter/material.dart';
import 'package:flutter_firestore/model/student.dart';
import 'package:flutter_firestore/services/firestore_service.dart';

class EditStudent extends StatefulWidget {
  final Student student;
  EditStudent({this.student, Key key}) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController _nameStudent = TextEditingController();
  TextEditingController _subjectStudent = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _nameStudent.text = widget.student.name;
    _subjectStudent.text = widget.student.subject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit : '),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameStudent,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _subjectStudent,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 45.0,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Colors.green,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Student student = Student(
                        id: widget.student.id,
                        name: _nameStudent.text,
                        subject: _subjectStudent.text);
                    await FirestoreService().updateStudent(student);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
