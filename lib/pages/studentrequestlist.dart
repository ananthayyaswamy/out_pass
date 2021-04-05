import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/requests.dart';

import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';

import 'homePage.dart';
class studentrequestLists extends StatefulWidget {
  @override
  _studentrequestListsState createState() => _studentrequestListsState();
}

class _studentrequestListsState extends State<studentrequestLists> {
  List<Student> s=[];
  @override
  Future<void> initState()  {

    // TODO: implement initState
    super.initState();


    setState(() {

    });
  }
  Future<List<Student>> getval() async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    String email=auth.currentUser.email;
    List<Student> s=getRequests( email);
    print(s.length);
    return s;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        backgroundColor: Colors.green[100],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("my request lists"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/studentrequestlist');
              },
            )
          ],
        ),
        // body:
        //
        // Center(
        //
        //   child: new ListView.builder(
        //       itemCount: s.length,
        //       itemBuilder: (_,index){
        //         return Card(
        //           child: ListTile(
        //             title: Text('reason :${s[index].reason}'),
        //             subtitle: Text('status: ${s[index].requestStatus}'),
        //             onTap: (){
        //               Navigator.push(context, new MaterialPageRoute(builder: (context)=>Requests(s[index])));
        //
        //             },
        //           ),
        //         );
        //       }
        //   ),
        // )

body: Container(
  child: FutureBuilder(

    future:getval() ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      if(!snapshot.hasData){
        return Container(
          child: Center(
            child: Text("LOADING"),
          ),
        );
      }else{
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder:(BuildContext context,int index) {
         return Card(
           child: ListTile(
             title:Text(snapshot.data[index].reason),
             onTap: (){
               Navigator.push(context, new MaterialPageRoute(builder: (context)=>Requests(snapshot.data[index])));
             },
           ),
         ) ;
          },
        );
      }
    },
  ),
),

    );
  }
}
