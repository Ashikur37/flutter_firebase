import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String name, String father_name, String mother_name, String nid) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'father_name': father_name,
      'mother_name': mother_name,
      'nid': nid
    });
  }
}
