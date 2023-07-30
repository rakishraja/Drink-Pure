
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'welcome_Screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(login());
}
class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void loginup() async {
    print( _emailController.text);
    print(_passwordController.text);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      Navigator.pushNamed(context,'welcome_Screen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('if');
        SnackBar snackbar = SnackBar(
          content:  Text("User not found!"),
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
      else if (e.code == 'wrong-password') {
        print('Else-If');
        SnackBar snackbar = SnackBar(
          content:  Text("Wrong password!"),
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
      else{
        print('else');
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
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/564x/6f/09/5d/6f095ddf8abff51799724f146ede998f.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding: EdgeInsets.fromLTRB(8, 0, 10.00, 125.01),
                  margin: EdgeInsets.fromLTRB(6.5,0, 0, 5),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 50, color: Colors.white),
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
                          Colors.black,
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
                      prefixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed:(){
                    loginup();
                    _emailController.clear();
                    _passwordController.clear();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text(
                    '   Log In   ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                  SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, 'reset');
                }, child: Text('Forgot password?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18,decoration: TextDecoration.underline),)),
                SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17
                      ),),
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                      Navigator.pushNamed(context, 'signup');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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