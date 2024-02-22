import 'dart:io';
import 'package:authapp/data/api/methods/post.dart';
import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:authapp/data/api/services/api_urls.dart';
import 'package:authapp/data/api/services/base_api_service.dart';
import 'package:http/http.dart' as http;

class LoginApiService extends BaseApiService {
  @override
  Future loginUser({
    required String email,
    required String password,
  })async {
    try {
      final response = await  postMethod(
        url: ApiEndPoints.login,
        body: {
          'username': email,
          'password': password,
        },
      );
      return validateLogin(response);
    } catch (e) {
      if (e is ApplicationErrorException) {
        throw DataFetchException(e.toString());
      } else if (e is SocketException) {
        throw DataFetchException("Connection failed, Please check your internet.");
      }else{
         throw DataFetchException("Something went wrong: ${e.toString()}");
      }
     
    }
  }
}
dynamic validateLogin(http.Response response)async {
 
  
  try {
    
    switch (response.statusCode) {
      case 200:
        // storing access token in flutter secure storage.
        // TokenServices tokenServices = TokenServices();
        // var data = json.decode(response.body);
        // await tokenServices.storeAccessToken(data['access_token']);
        return true;
      
      case 400:
        throw BadRequestException("Request failed,Please check your input.");
      case 401:
        throw UnauthorizedRequestException("Invalid credentials, Please check your input.");
      case 403:
        throw ForbiddenRequestException("Forbidden, Please check your input.");
      case 404:
        throw NotFoundRequestException("Not found, Please check your input.");
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