import 'package:flutter/material.dart';
import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';
class Requests extends StatefulWidget {
  final Student student;
Requests(this.student);
 // const Requests({Key key, this.student}) : super(key: key);
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //List<Student> val=getRequests(st);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green[100],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("request details"),
      ),
        body: Center(
          child: new Container(

          ),
        ),
    );
  }
}
