import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Student{
  final String name;
  final String emailID;
  final String rollNo;
  final String phoneNumber;
  final String reason;
  final String emailId;
  DatabaseReference _id;

  Student(this.emailID, this.name, this.phoneNumber, this.reason,this.rollNo, this.emailId);

  void setId(DatabaseReference id){
    this._id=id;
  }
Map<String,dynamic>toJson(){
    return{
      'emailId':this.emailID,
      'rollNo':this.rollNo,
      'phoneNumber':this.phoneNumber,
      'name':this.name,
      'reason':this.reason,


    };
}
}