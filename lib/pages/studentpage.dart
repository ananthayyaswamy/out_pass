import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/student.dart';
class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  final fb=FirebaseDatabase.instance.reference().child("Mydata");
  List<Student> list=List();
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("student"),
      ),

    );
  }
}
