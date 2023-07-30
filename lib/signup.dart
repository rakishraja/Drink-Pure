import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp1());
}
class MyApp1 extends StatefulWidget {
  @override
  State<MyApp1> createState() => _MyApp1State();
}
class _MyApp1State extends State<MyApp1> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
          Navigator.pushNamed(context,'welcome_Screen');
    }
    catch (e) {
      SnackBar snackbar = SnackBar(
        content:  Text("Please enter details!"),
        backgroundColor: Colors.grey,
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.red,
          onPressed: () {},
        ),
      );
      _messangerKey.currentState?.showSnackBar(
          snackbar);
    }
    _emailController.clear();
    _passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
       image: NetworkImage('https://wallpapersmug.com/download/1080x2160/d3988f/ocean-tide-sea-nature.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image:
                          NetworkImage("https://i.pinimg.com/originals/67/d2/34/67d2341ff5ee9efe1472c31d98baf8d1.jpg"),
                              fit: BoxFit.cover)
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0,sigmaY: 0),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.fromLTRB(8, 4.00, 10.00, 115.01),
                      // margin: EdgeInsets.fromLTRB(6.5, 5, 0, 5),
                      child: Text(
                        'Register?',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
              Container(
              padding: EdgeInsets.fromLTRB(8, 4.00, 10.00, 115.01),
              margin: EdgeInsets.fromLTRB(6.5, 5, 0, 5),
              child: Text(
                'Enter details',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _emailController,

                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                          color: Colors.white,
                          width: 2),
                  ),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.black,
              ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color:
                      Colors.white,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                    )
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
                    SizedBox(height: 35,),
                    Container(
                      child: ElevatedButton(
                        onPressed:() {
                          signup();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: Text(
                          '   Sign up   ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ",style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('??',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19
                ),),
              ],
            ),
                    SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(
                        onPressed:() {
                          Navigator.pushNamed(context, 'login');
                          _emailController.clear();
                          _passwordController.clear();
                          },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: Text(
                          '   Log in   ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    ),
    ),
    ),
    );
  }
}


