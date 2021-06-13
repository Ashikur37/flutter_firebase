import 'package:fire/screens/authenticate/authenticate.dart';
import 'package:fire/services/database.dart';
import 'package:fire/services/porichoy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  var name = "";
  var nid_number = "";
  var father_name = "";
  var mother_name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                AuthService().logout();
              },
              child: Container(
                child: Text("Logout"),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    name = val;
                  },
                  decoration: InputDecoration(hintText: "Full Name"),
                ),
                TextFormField(
                  onChanged: (val) {
                    father_name = val;
                  },
                  decoration: InputDecoration(hintText: "Father Name"),
                ),
                TextFormField(
                  onChanged: (val) {
                    mother_name = val;
                  },
                  decoration: InputDecoration(hintText: "Mother Name"),
                ),
                TextFormField(
                  onChanged: (val) {
                    nid_number = val;
                  },
                  decoration: InputDecoration(hintText: "NID number"),
                ),
                GestureDetector(
                  onTap: () async {
                    await Porichoy().verifyNid(nid_number);
                    // var user =
                    //     await AuthService().user.first.then((value) => value);

                    // var data = DatabaseService(user.uid).updateUserData(
                    //     name, father_name, mother_name, nid_number);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 15.0,
                    ),
                    height: 45,
                    width: 80,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
