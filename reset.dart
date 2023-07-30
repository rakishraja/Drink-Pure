import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}
class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password'),backgroundColor: Color(
          0xFF000000),),
      body: Container(
        color: Color(0xFF2E3336),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                    hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,

                  )
                ),

                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                        0xFF000000))
                  ),
                  child: Text('Send Request'),
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },

                ),
              ],
            ),

          ],),
      ),
    );
  }
}