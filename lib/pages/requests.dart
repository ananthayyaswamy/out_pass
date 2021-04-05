import 'package:flutter/material.dart';
import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';
import 'package:google_fonts/google_fonts.dart';
class Requests extends StatefulWidget {
  final Student student;
Requests(this.student);
 // const Requests({Key key, this.student}) : super(key: key);
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController name1= new TextEditingController();
  TextEditingController rollNo1= new TextEditingController();
  TextEditingController reason1= new TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    reason1.text=widget.student.reason;
    rollNo1.text=widget.student.name;
    name1.text=widget.student.rollNo;
    //List<Student> val=getRequests(st);
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


          ],
        ),

      ) ,
    );
  }
}
