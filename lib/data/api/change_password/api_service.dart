import 'dart:io';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/methods/get_response.dart';
import 'package:authapp/data/api/services/base_api_service.dart';
import 'package:http/http.dart';

class ChangePasswordApiService extends BaseApiService {
  @override
  Future changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      required String email}) {
    try {
      final response = post(
        Uri.parse(ApiEndPoints.SIGN_UP),
        body: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword
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
