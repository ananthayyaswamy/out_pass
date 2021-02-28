import 'package:firebase_database/firebase_database.dart';
import 'package:out_pass/pages/student.dart';
final List<Student> students=[];
final databaseReference=FirebaseDatabase.instance.reference();
DatabaseReference saverequest(Student student){
  var id=databaseReference.child('leaveRequest/').push();

  print("fun called");
  id.set(student.toJson());
  student.setId(id);
  students.add(student);
  print("saving stp ${id.toString()}");
  return id;
}


