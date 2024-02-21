import 'dart:io';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/methods/get_response.dart';
import 'package:authapp/data/api/services/base_api_service.dart';
import 'package:http/http.dart';

class LoginApiService extends BaseApiService {
  @override
  Future loginUser({
    required String email,
    required String password,
  }) {
    try {
      final response = post(
        Uri.parse(ApiEndPoints.SIGN_UP),
        body: {
          'email': email,
          'password': password,
        },
      );
      return response.then((value) => getResponse(value));
    } catch (e) {
      if (e is ApplicationErrorException) {
        throw DataFetchException(e.toString());
      } else if (e is SocketException) {
        throw DataFetchException("Socket Exception: ${e.toString()}");
      }
      throw DataFetchException("Something went wrong: ${e.toString()}");
    }
  }
}
