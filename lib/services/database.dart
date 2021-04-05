import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:out_pass/pages/list.dart';
import 'package:out_pass/pages/student.dart';
//final List<Student> students=[];
final List <Student> students = new List <Student>();
HashMap hashMap = new HashMap<String, String>();
HashMap hashMap1 = new HashMap<String, String>();
List<Student> student1=[];
final databaseReference=FirebaseDatabase.instance.reference();

DatabaseReference saverequest(Student student){
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser.uid;
  var id=databaseReference.child('Request/${uid}').push();
  //var id1=databaseReference.child('leaveRequest').push();

  print(id.path);

  student.setId(id);
  students.add(student);
  print("fun called");
  id.set(student.toJson());



  student.setId(id);
  students.add(student);
  print(student.toJson());
  print(students.length);
  print("saving stp ${id}");
  return id;
}
DatabaseReference updaterequest(Student student2){
  print(students.length);
//print(" id= "+hashMap[ 18f204]);
//   print(hashMap);
//   for(Student i in students){
//     if(i.rollNo==student2.rollNo){
//       String val=i.getId().key;
//       print(val);
//       var id=databaseReference.child('Request/${student2.rollNo}/$val').push();
//       //var id=databaseReference.child('Request/${student2.rollNo}/$val').update(student2.toJson());
//       print(id.key);
//       // var id1=databaseReference.child('leaveRequest').push();
//
//       id.set(student2.toJson());
//       //id1.set(student.toJson());
//
//       student2.setId(id);
//       students.add(student2);
//       print(student2.toJson());
//       print("saving stp ${student2.requestStatus}");
//       return id;
//     }
//
//  }

      String val = student2
          .getId()
          .path;
      print(val);
      databaseReference.child(val).update(
          student2.toJson()).then((value) => Navigator.defaultRouteName);

}
  Future<Student> getRequestsRoll(String roll) async{
print("roll"+roll);
 // DatabaseReference ref=FirebaseDatabase.instance.reference();
  var id1=await databaseReference.child('Request/${roll}').once().then((DataSnapshot snap){
    var keys=snap.value.keys;
    var data=snap.value;
    student1.clear();
    for(var key in keys){

      Student s=new Student(
        data[key]['emailId'],
        data[key]['name'],
        data[key]['phoneNumber'],
        data[key]['reason'],
        data[key]['rollNo'],
        data[key]['requestStatus'],

      );
      //print(s.reason+" s");
     // print(st.rollNo+"st");
      //student1.add(st);
      print(s.toJson());

      if(s.reason==roll){
        print("hurray"+s.toString());
        student1.add(s);
        s.requestStatus=true;
        print(s.getId());
        updaterequest(s);
        return s;


      }}

  });


}
List getRequests(String email){
  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid=auth.currentUser.uid;
print("inside get requests");
  DatabaseReference ref=FirebaseDatabase.instance.reference();
  ref.child('Request/${uid}').once().then((DataSnapshot snap){
    var keys=snap.value.keys;
    var data=snap.value;
    student1.clear();
    for(var key in keys){
print("in for");
      Student s=new Student(
        data[key]['emailId'],
        data[key]['name'],
        data[key]['phoneNumber'],
        data[key]['reason'],
        data[key]['rollNo'],
        data[key]['requestStatus'],

      );


          student1.add(s);
          print(s.toJson());

   }

  });


return student1;
}

