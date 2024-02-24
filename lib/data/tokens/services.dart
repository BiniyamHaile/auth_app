import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenServices {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
  encryptedSharedPreferences: true,
        );

  Future<void> storeAccessToken(String token) async{
    final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    await storage.write(key: "accessToken", value: token);
  }

  Future<String?> getAccessToken(String token) async{
   final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
   String? token =  await storage.read(key: "accessToken");
    return token;
  }
}