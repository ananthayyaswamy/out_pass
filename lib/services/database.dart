import 'package:firebase_database/firebase_database.dart';
import 'package:out_pass/pages/student.dart';
final List<Student> students=[];
List<Student> student1=[];
final databaseReference=FirebaseDatabase.instance.reference();
DatabaseReference saverequest(Student student){
  var id=databaseReference.child('Request/${student.rollNo}').push();

  print("fun called");
  id.set(student.toJson());
  student.setId(id);
  students.add(student);
  print(student.toJson());
  print("saving stp ${id}");
  return id;
}


List getRequests(Student st){

  DatabaseReference ref=FirebaseDatabase.instance.reference();
  ref.child('Request/${st.rollNo}').once().then((DataSnapshot snap){
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
      print(s.reason+" s");
      print(st.rollNo+"st");
      student1.add(st);
      if(s.reason==st.rollNo){
          student1.add(s);

      print(student1.length);
    }}

  });


return student1;
}

