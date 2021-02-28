import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Student{
  final String emailID;
  final String rollNo;
  final String phoneNumber;
  DatabaseReference _id;

  Student(this.emailID, this.rollNo, this.phoneNumber);

  void setId(DatabaseReference id){
    this._id=id;
  }
Map<String,dynamic>toJson(){
    return{
      'emailId':this.emailID,
      'rollNo':this.rollNo,
      'phoneNumber':this.phoneNumber

    };
}
}