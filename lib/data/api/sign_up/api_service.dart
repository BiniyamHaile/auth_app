import 'dart:io';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/methods/get_response.dart';
import 'package:authapp/data/api/services/base_api_service.dart';
import 'package:http/http.dart';

class SignUpApiService extends BaseApiService {
  @override
  Future signUpUser(
      {required String email,
      required String confirmPassword,
      required String password,
      required String firstName,
      required String lastName}) {
    try {
      final response = post(
        Uri.parse(ApiEndPoints.SIGN_UP),
        body: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'firstName': firstName,
          'lastName': lastName,
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
