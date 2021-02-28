import 'package:flutter/material.dart';
import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';
class LeaveDetails extends StatefulWidget {


  final Student student;
 // final int index;

  //const LeaveDetails({Key key, this.index}) : super(key: key);
   LeaveDetails(this.student);
  @override
  _LeaveDetailsState createState() => _LeaveDetailsState();
}

class _LeaveDetailsState extends State<LeaveDetails> {
  //final Student student;
  // final int index;

  TextEditingController name1= new TextEditingController();
  TextEditingController rollNo1= new TextEditingController();
  TextEditingController reason1= new TextEditingController();

  //_LeaveDetailsState(this.student);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reason1.text=widget.student.reason;
    rollNo1.text=widget.student.rollNo;
    name1.text=widget.student.name;
    //date1.text=widget.student.;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(rollNo1.text),

      ),
      body:Container(
child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Row(mainAxisAlignment: MainAxisAlignment.center,

    children: [
      SizedBox(height: 100,width: 0,),
      Flexible(
        fit: FlexFit.loose,
        flex: 2,

        child: Container(
          child: Text('reason:${reason1.text}',style: TextStyle(
            fontSize: 20,
            color: Colors.green
          ),),
        ),
      )
    ],)
  ],
),

      ) ,
    );
  }
}
