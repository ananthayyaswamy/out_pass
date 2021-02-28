import 'package:firebase_database/firebase_database.dart';
import 'package:out_pass/pages/student.dart';

final databaseReference=FirebaseDatabase.instance.reference();
DatabaseReference saverequest(Student student){
  var id=databaseReference.child('leaveRequest/').push();
  id.set({student.toJson()});
  return id;
}