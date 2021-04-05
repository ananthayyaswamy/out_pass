import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/leaveDetails.dart';
import 'package:out_pass/pages/student.dart';
class WardenPage extends StatefulWidget {
  @override
  _WardenPageState createState() => _WardenPageState();
}
class _WardenPageState extends State<WardenPage> {
  List<Student> student=[];
  var retrievedName="";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference ref=FirebaseDatabase.instance.reference();
    ref.child('leaveRequest').once().then((DataSnapshot snap){
      var keys=snap.value.keys;
      var data=snap.value;
      student.clear();
      for(var key in keys){
        Student s=new Student(
          data[key]['emailId'],
          data[key]['rollNo'],
          data[key]['phoneNumber'],
          data[key]['name'],
          data[key]['reason'],
          data[key]['requestStatus'],


        );
        student.add(s);
        print(s.rollNo+" "+s.name+"  "+s.emailID);

      }
      setState(() {
        print('length:${student.length}');


      });
    });


  }
  @override
  Widget build(BuildContext context) {

     return Scaffold(
      backgroundColor: Colors.green[100],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("warden"),
      ),
        body:Center(
          child: new Container(
child: Center(
  child:   student.length==0?new CircularProgressIndicator():

  new ListView.builder(

              itemCount: student.length,

    itemBuilder: (_,index){

      return Card(

        child: ListTile(

            title: Text('rollNumber: ${student[index].rollNo}'),

            subtitle:Text('Name: ${student[index].name}') ,

            onTap: (){

              Navigator.push(context, new MaterialPageRoute(builder: (context)=>LeaveDetails(student[index])));

            },

        ),



      );



  },),
),
          ),
        )

    );
  }
  Widget UI(String name,String rollNumber ){

  return ListView.builder(
    itemCount: student.length,
    itemBuilder: (BuildContext context,int index){
      return Card(
        child: ListTile(
          title: Text('rollNumber: $rollNumber'),
          subtitle:Text('Name: $name') ,
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>LeaveDetails(student[index])));
          },
        ),

      );
    },
  );
  // return new Card(
  //   child: new Container(
  //     child: new Column(
  //        children: [
  //          new Text('Name: $name'),
  //          new Text('rollNumber: $rollNumber')
  //
  //        ],
  //     ),
  //   ),
  //
  // );
  }

}