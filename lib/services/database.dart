import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  final CollectionReference taskCollection =
      Firestore.instance.collection('tasks');

  Future updateUserData(String name, String asignee, int type) async {
    return await taskCollection.document(uid).setData({
      'name': name,
      'asignee': asignee,
      'type': type,
    });
  }
}
