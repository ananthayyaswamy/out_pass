import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:out_pass/pages/newrequestOrViewRequests.dart';
import 'package:out_pass/pages/studentpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      signOutUsingGoogle();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        resizeToAvoidBottomPadding: false,

        body: SafeArea(

          child :Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15, 0, 0),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 20,),
                    Flexible(flex: 2,
                      fit:FlexFit.loose,
                      child: Container(
                        child: Image.asset('assets/kce.jpeg',
                          height: 50,
                          width: 100,),
                      ),),],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 125,),
                    Flexible(flex: 2,
                      fit:FlexFit.loose,
                      child: Container(
                        child: Text("Welcome Back!",style: TextStyle(
                          fontSize: 20,

                        ),),
                      ),),],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                        fit:FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20,0),
                          child:Container(
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                //icon: Icon(Icons.email,color: Colors.limeAccent,),
                                fillColor: Colors.black,
                                labelText: 'Enter email',
                                labelStyle: TextStyle(

                                  color: Colors.grey[500],
                                  // fontWeight: FontWeight.bold

                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                              ),

                            ),
                          ),

                        )
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                        fit:FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20,0),
                          child:Container(
                            child: TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                // icon: Icon(Icons.admin_panel_settings,color: Colors.limeAccent,),
                                fillColor: Colors.black,
                                labelText: 'Enter password',
                                labelStyle: TextStyle(

                                  color: Colors.grey[500],


                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                              ),

                            ),
                          ),

                        )
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                        fit:FlexFit.loose,
                        child: Container(
                          width: 300,

                          child: RaisedButton(

                            child: Text(
                              "Login",style: TextStyle(fontSize: 18,color: Colors.white),


                            ),
                            onPressed: (){
                              print("pressed");
                              Navigator.pushNamed(context, '/datasources');


                            },
                            color:Colors.blue,
                            // shape:RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(18.0),
                            //
                            // ),





                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                      fit:FlexFit.loose,

                      child:  Text("or",style: TextStyle(
                        fontSize: 15,

                      ),),

                    )




                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                        fit:FlexFit.loose,
                        child:  Container(
                          child: SignInButton(
                            Buttons.Google,
                            text: "Sign in with Google",
                            onPressed: (){

                              setState(() {
                               signinUsingGoogle();


                               });
                            },
                          ),
                        )

                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 2,
                      fit:FlexFit.loose,
                      child: Column(
                        children: [
                          Container(
                            child: Text("dont have an account?",style: TextStyle(
                              fontSize: 15,

                            ),),

                          ),

                          // Container(
                          //   child: FlatButton(
                          //     child: Text('Sign up',style: TextStyle(
                          //       color: Colors.indigoAccent
                          //     ),),
                          //
                          //     onPressed: (){
                          //       print('button pressed');
                          //     },
                          //
                          //   )
                          //
                          // ),
                        ],
                      ),

                    ),
                    Flexible(flex: 2,
                      fit:FlexFit.loose,
                      child: Column(
                        children: [


                          Container(
                              child: FlatButton(
                                child: Text('Sign up',style: TextStyle(
                                    color: Colors.indigoAccent
                                ),),

                                onPressed: (){
                                  print('button pressed');

                                },

                              )

                          ),
                        ],
                      ),

                    )
                    // Container(
                    // child: Text("dont have an account?",style: TextStyle(
                    //      fontSize: 15,
                    //
                    //  ),),f
                    //
                    //  ),






                  ],

                ),
              ],
            ),
          ),
        )

    );
  }

Future<void> signinUsingGoogle() async{
    final GoogleSignInAccount googleUser=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth=await googleUser.authentication;
    final GoogleAuthCredential googleCredential = GoogleAuthProvider
        .credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential googleUserCredential =
    await FirebaseAuth.instance.signInWithCredential(googleCredential);
    try{

      if(googleUserCredential!=null){
        print('signed into google');
        String s= googleUserCredential.user.email;

        print(s);
        if(s=="ananthayyaswamy@gmail.com"){
          Navigator.pushReplacementNamed(context, '/WardenPage');
        }else {
          // Navigator.pushReplacementNamed(
          //     context, '/StudentPage');
          //Navigator.pushReplacementNamed(context,'/StudentPage' );
          Navigator.push(context, new MaterialPageRoute(builder: (context)=>choice()));
        //  Navigator.pushReplacementNamed(context, '/neworview');
      }}
      else{
        print('not signed in');
        return null;
      }
    }catch(e){
      print(e.toString());
    }

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
