import 'package:fire/screens/authenticate/register.dart';
import 'package:fire/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign  in"),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter email' : null,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                  ),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter password",
                  ),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      var res = AuthService().signinWithEmail(email, password);
                    }
                  },
                  child: Text(
                    'Sign in',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    'Sign up',
                  ),
                )
              ],
            ),
          )),
      backgroundColor: Colors.brown[100],
    );
  }
}
