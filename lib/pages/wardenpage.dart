import 'package:flutter/material.dart';
class WardenPage extends StatefulWidget {
  @override
  _WardenPageState createState() => _WardenPageState();
}

class _WardenPageState extends State<WardenPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.green[100],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("warden"),
      ),

    );
  }
}