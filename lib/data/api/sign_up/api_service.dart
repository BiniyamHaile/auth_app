import 'dart:io';
import 'package:authapp/data/api/methods/post.dart';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/methods/get_response.dart';
import 'package:authapp/data/api/services/base_api_service.dart';

class SignUpApiService extends BaseApiService {
  @override
  Future signUpUser(
      {required String email,
      required String confirmPassword,
      required String password,
      required String firstName,
      required String lastName})async {
    try {
      final response = await postMethod(
        url: ApiEndPoints.signUp,
        body: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'firstName': firstName,
          'lastName': lastName,
        },
      );

      return getResponse(response);
    } catch (e) {
      if (e is ApplicationErrorException) {
        throw DataFetchException(e.toString());
      } else if (e is SocketException) {
        throw DataFetchException("Connection failed, Please check your internet.");
      }
      throw DataFetchException("Something went wrong, Please try again later.");
    }
  }
}
