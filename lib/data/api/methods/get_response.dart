import 'dart:io';

import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic getResponse(http.Response response) {
  if (response.statusCode == 200) {
      
      return true;
    } 
  try {
    
    final responseMessage = jsonDecode(response.body);
    switch (response.statusCode) {
      
      
      case 400:
        throw BadRequestException(responseMessage['message'] );
      case 401:
        throw UnauthorizedRequestException("");
      case 403:
        throw ForbiddenRequestException(responseMessage['message']);
      case 404:
        throw NotFoundRequestException(responseMessage['message']);
      case 500:
        throw InternalServerErrorException("Internal server error, Please try again later.");
      default:
        throw DataFetchException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  } on SocketException{
    
    rethrow;
  }
}
