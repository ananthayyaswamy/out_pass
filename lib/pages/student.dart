import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
class Student{
  final String name;
  final String emailID;
  final String rollNo;
  final String phoneNumber;
  final String reason;
 // final String emailId;
  bool requestStatus=false;
   DatabaseReference _id;

  Student(this.emailID, this.rollNo, this.phoneNumber, this.name,this.reason,this.requestStatus);

  void setId(DatabaseReference id){
    this._id=id;
  }
  DatabaseReference getId(){
    return _id;
  }
Map<String,dynamic>toJson(){
    return{
      'emailId':this.emailID,
      'rollNo':this.rollNo,
      'phoneNumber':this.phoneNumber,
      'name':this.name,
      'reason':this.reason,
      'requestStatus':this.requestStatus


    };}

}