import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postMethod(
    {required String url, required Map<String, dynamic> body}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.36.3'
    },
    body: jsonEncode(body),
  );
  return  response;
}
