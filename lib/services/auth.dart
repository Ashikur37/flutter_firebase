import 'package:fire/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFireBaseUser(user));
        .map(_userFromFireBaseUser);
  }

  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  //signin anonymous
  Future signinAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e);
    }
  }

  //signin with email

  Future signinWithEmail(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFireBaseUser(user);
  }

  //register with email

  Future register(String email, String password) async {
    var res = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return res;
  }

  // logout

}
