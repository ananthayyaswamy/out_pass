import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/homePage.dart';
import 'package:out_pass/pages/leaveDetails.dart';
import 'package:out_pass/pages/studentpage.dart';
import 'package:out_pass/pages/wardenpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/home':(context)=>Home(),
      '/StudentPage':(context)=>StudentPage(),
      '/WardenPage':(context)=>WardenPage(),

    }
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();}}