import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';
import 'package:google_fonts/google_fonts.dart';
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
    rollNo1.text=widget.student.name;
    name1.text=widget.student.rollNo;
    //date1.text=widget.student.;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.grey[100],
      body:SafeArea(

child: Column(


  mainAxisAlignment: MainAxisAlignment.start,

  children: [
    SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Container(
            child: Image.asset('assets/kce.jpeg',height: 50,width: 100,),
          ),
        ),
      ],
    ),
  SizedBox(height: 50,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,fit: FlexFit.loose,
          child: Container(
            child: Text("Details",style:GoogleFonts.lora(fontSize: 40,color: Colors.black)),
          ),
        )
      ],
    ),
    SizedBox(height: 20,),
    Divider(
      color: Colors.black,
      thickness: 5,
    ),
    SizedBox(height: 50,),
    Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Flexible(
            flex: 1,fit: FlexFit.loose,
            child: Container(
              child: Text("name : ${rollNo1.text}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[600]),),

            ),
          ),
        )
      ],
    ),
    Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Flexible(
            flex: 1,fit: FlexFit.loose,
            child: Container(
              child: Text("rollno : ${name1.text}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[600]),),

            ),
          ),
        )
      ],
    ),
    Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Flexible(
            flex: 1,fit: FlexFit.loose,
            child: Container(
              child: Text("reason : ${reason1.text}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[600]),),

            ),
          ),
        )
      ],
    ),
    SizedBox(height: 80,),
    Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Flexible(
            flex: 1,fit: FlexFit.loose,
            child: Container(
              child: MaterialButton(
                minWidth: 150.0,
                height: 35,
                color: Colors.green,
                child: new Text('Accept',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {},
              ),

            ),

          ),

        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Flexible(
            flex: 1,fit: FlexFit.loose,
            child: Container(
              child: MaterialButton(
                minWidth: 150.0,
                height: 35,
                color: Colors.red,
                child: new Text('Reject',
                    style: new TextStyle(fontSize: 16.0, color: Colors.white)),
                onPressed: () {},
              ),

            ),

          ),

        ),
      ],
    )

  ],
),

      ) ,
    );
  }
}
