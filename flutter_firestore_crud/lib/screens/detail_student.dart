import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  final String name;
  final String subject;

  StudentDetail({this.name, this.subject, Key key}) : super(key: key);

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.name,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              Text(widget.subject, style: TextStyle(fontSize: 22.0)),
              Container(
                width: 130.0,
                margin: EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
