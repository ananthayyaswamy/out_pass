import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
class ListJson{
 final  List student;

  ListJson(this.student);
 Map<String,dynamic>toJson1(){
  return{
   'list':this.student


  };

 }
}