import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class choice extends StatefulWidget {
  @override
  _choiceState createState() => _choiceState();
}

class _choiceState extends State<choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1,
                  fit: FlexFit.loose,
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                          "New Request"
                        ),
                        onPressed: (){
                         // Navigator.pushNamed(context, '/studentrequestlist');
                          Navigator.pushNamed(context, '/StudentPage');
                        },
                      ),

                    ),

                  ),
                  SizedBox(width: 10,),
                  Flexible(flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            "view requests"
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/studentrequestlist');
                        },
                      ),

                    ),

                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      child: RaisedButton(
                        child: Text(
                            "logout"
                        ),
                        onPressed: (){
                          signOutUsingGoogle();
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),

                    ),

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth mAuth =FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  Future<void> signOutUsingGoogle() async {
    await mAuth.signOut().then((_){
      googleSignIn.signOut();
      print('signed out successfully');
      // setState(() {
      //  // isuserloggedin=false;
      //   Navigator.pushNamed(context, '/home');
      // });
    }

    );
  }
}
