import 'dart:convert';
import 'package:authapp/data/tokens/services.dart';
import 'package:http/http.dart' as http;

Future<http.Response> putMethod(
    {required String url, required Map<String, dynamic> body}) async {
  TokenServices tokenServices = TokenServices();
  String? token = await tokenServices.getAccessToken("accessToken");
  final response = await http.put(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.36.3', 
      'bearer': '$token'
    },
    body: jsonEncode(body),
  );
  return response;
}