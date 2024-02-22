import 'dart:io';
import 'package:authapp/data/api/methods/put_method.dart';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/services/base_api_service.dart';
import 'package:http/http.dart' as http;

class ChangePasswordApiService extends BaseApiService {
  @override
  Future changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      required String email}) async{
    try {
      final response = await putMethod(
        url: ApiEndPoints.changePassword,
        body: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword
        },
      );
      return validateChangePassword(response);
     
     

    } catch (e) {
      
      if (e is ApplicationErrorException) {
        throw DataFetchException(e.toString());
      } else if (e is SocketException) {
        throw DataFetchException("Connection failed, Please check your internet.");
      }
      else{
        throw DataFetchException("Something went wrong: ${e.toString()}");
      }
    }
  }
}



dynamic validateChangePassword(http.Response response) {
  if (response.statusCode == 200) {
      
      return true;
    } 
  try {
    
    switch (response.statusCode) {
      
      
      case 400:
        throw BadRequestException("Your token has expired, Please login again.");
      case 401:
        throw UnauthorizedRequestException("Your token has expired, Please login again.");
      case 403:
        throw ForbiddenRequestException("Request failed,Please check your input.");
      case 404:
        throw NotFoundRequestException("User not found, Please check your input.");
      case 500:
        throw InternalServerErrorException("Internal server error, Please try again later.");
      default:
        throw DataFetchException(
            'Error occurred while communication with server, try again later.');
    }
  } on SocketException{
    
    rethrow;
  }
}
