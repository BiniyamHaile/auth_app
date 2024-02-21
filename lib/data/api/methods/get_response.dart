import 'package:authapp/data/api/services/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic getResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.toString());
    case 401:
      throw UnauthorizedRequestException(response.toString());
    case 403:
      throw ForbiddenRequestException(response.toString());
    case 404:
      dynamic responseJson = jsonDecode(response.body);
      throw NotFoundRequestException(responseJson['message']);
    case 500:
      throw InternalServerErrorException(response.toString());
    default:
      throw DataFetchException(
          'Error occurred while communication with server with status code : ${response.statusCode}');
  }
}
