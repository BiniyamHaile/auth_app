import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<http.Response> post(
    {required String url, required Map<String, dynamic> body}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode(body),
  );
  return response;
}
