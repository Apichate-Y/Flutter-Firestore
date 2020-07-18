import 'package:flutter/material.dart';
import 'package:flutter_firestore/model/student.dart';
import 'package:flutter_firestore/services/firestore_service.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController _nameStudent = TextEditingController();
  TextEditingController _subjectStudent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Student'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
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
                        name: _nameStudent.text, subject: _subjectStudent.text);
                         await FirestoreService().addStudent(student);
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
