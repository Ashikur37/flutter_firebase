import 'package:fire/services/http.dart';

class Porichoy {
  static const serverUrl = "http://188.166.241.100";
  static const token =
      "JiUrLWVzZvjM2za3N8RO6ORRAI6LHioYocoS9UUOvnGtr4Jfyi60ac8c2b7a7e0";
  Future verifyNid(String nid) async {
    //1234567890
    var data = await getHttp(
        "$serverUrl/kyc/api/get-info?id_number=$nid&token=$token");
    print(data);
  }
}
