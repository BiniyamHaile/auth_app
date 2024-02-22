import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenServices {
  final storage = const FlutterSecureStorage();
  Future<void> storeAccessToken(String token) async{
    await storage.write(key: "accessToken", value: token);
  }

  Future<String?> getAccessToken(String token) async{
   String? token =  await storage.read(key: "accessToken");
    return token;
  }
}