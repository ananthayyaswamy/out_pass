
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:out_pass/pages/requests.dart';
import 'package:out_pass/pages/student.dart';
import 'package:out_pass/services/database.dart';
class StudentPage extends StatefulWidget {

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {


 bool val=false;
Student st;

 //final FirebaseUser user;



 String _name;
 String _email;
 String _roll;
 String _phone;
 String _reason;

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //_StudentPageState(this.user);

 Widget _buildNameField() {
  return TextFormField(
   decoration: InputDecoration(labelText: 'Name'),
   maxLength: 12,
   validator: (String value) {
    if (value.isEmpty)
     return 'Name is Required';
    return null;
   },
   onSaved: (String value) {
    _name = value;
   },
  );
 }

 Widget _buildEmailField() {
  return TextFormField(
   decoration: InputDecoration(labelText: 'Email'),
   validator: (String value) {
    if (value.isEmpty) {
     return 'Email is Required';
    }

    if (!RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
     return 'Please enter a valid email Address';
    }

    return null;
   },
   onSaved: (String value) {
    _email = value;
   },
  );
 }


 Widget _buildRollField() {
  return TextFormField(
   decoration: InputDecoration(labelText: 'Roll'),
   validator: (String value) {
    if (value.isEmpty)
     return 'Roll is Required';
    return null;
   },
   onSaved: (String value) {
    _roll = value;
   },
  );
 }

 Widget _buildPhoneField() {
  return TextFormField(
   decoration: InputDecoration(labelText: 'Phone'),
   keyboardType: TextInputType.phone,
   validator: (String value) {
    if (value.isEmpty)
     return 'Phone is Required';
    return null;
   },
   onSaved: (String value) {
    _phone = value;
   },
  );
 }

 Widget _buildReasonField() {
  return TextFormField(
   decoration: InputDecoration(labelText: 'Reason'),
   validator: (String value) {
    if (value.isEmpty)
     return 'Reason is Required';
    return null;
   },
   onSaved: (String value) {
    _reason = value;
   },
  );
 }

 @override
 Widget build(BuildContext context) {

  if(val==false){
  return


   Scaffold(

   appBar: AppBar(
    title: Text("Student"),
   ),
   body: Container(
    margin: EdgeInsets.all(24),
    child: Form(
     key: _formKey,
     child: SingleChildScrollView(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        _buildNameField(),
        _buildEmailField(),
        _buildRollField(),
        _buildPhoneField(),
        _buildReasonField(),
        SizedBox(height: 100),
        RaisedButton(
         child: Text(
          'Submit',
          style: TextStyle(color: Colors.blue, fontSize: 16),
         ),
         onPressed: () {
          if (!_formKey.currentState.validate()) {
           return;
          }
          _formKey.currentState.save();
          _formKey.currentState.setState(() {
           st = Student(_email, _roll, _phone, _name, _reason,false);
           print("step 1");
           saverequest(st);
           print("step 2");


           val=true;

          });
setState(() {

});
          // setState(() {
          //  Student st = Student(_email, _roll, _phone, _name, _reason,false);
          //  print("step 1");
          //  saverequest(st);
          //  print("step 2");
          //
          //
          //  return;
          // });
          //_formKey.currentState.save();
          print(_name);
          print(_email);
          print(_roll);
          print(_phone);
          print(_reason);

         // Navigator.pushReplacementNamed(context, '/myrequest');
         })
       ],
      ),
     ),
    ),
   ),
  );}
  else {
   List<Student> s=getRequests(st);
   print("hi");
   setState(() {

   });
   return Scaffold(

    backgroundColor: Colors.green[100],
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
     title: Text("my request lists"),
    ),
    body: Center(
     child: new ListView.builder(
      itemCount: s.length,
      itemBuilder: (_,index){
       return Card(
        child: ListTile(
         title: Text('reason :${s[index].reason}'),
         subtitle: Text('status: ${s[index].requestStatus}'),
         onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>Requests(s[index])));

         },
        ),
       );
      }
     ),
    )


   );


  }
 }
}