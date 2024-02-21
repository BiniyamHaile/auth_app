class BaseApiService {
  // Future<dynamic> post({required String url,  required  Map<String,dynamic> body}) async {}
  // Future<dynamic> get({required String url}) async {}
  Future<dynamic> loginUser(
      {required String email, required String password}) async {}
  Future<dynamic> signUpUser(
      {required String email,
      required String confirmPassword,
      required String password,
      required String firstName,
      required String lastName}) async {}
  Future<dynamic> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword,
      required String email}) async {}
}
