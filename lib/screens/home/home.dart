import 'package:fire/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              AuthService().logout();
            },
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.all(50),
              child: Text("Logout"),
            ),
          ),
        ),
      ),
    );
  }
}
