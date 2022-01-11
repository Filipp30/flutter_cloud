import 'dart:convert';
import 'package:cloud_app/data_layer/data_providers/auth_provider.dart';
import 'package:cloud_app/data_layer/models/registration_error_response_model.dart';
import 'package:cloud_app/data_layer/models/user_registration_model.dart';
import 'package:http/http.dart';


abstract class AuthBase{
  Future<Object?> createNewAccount({required UserRegistrationModel user});
}

class AuthRepository extends AuthBase{

  @override
  Future<Object?> createNewAccount({required UserRegistrationModel user}) async {
    Response response = await AuthProvider.createNewAccount(user: user);
    if (response.statusCode == 200) {
      return true;
    }
    if (response.statusCode != 200) {
      return  RegistrationErrorResponseModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
  }
}