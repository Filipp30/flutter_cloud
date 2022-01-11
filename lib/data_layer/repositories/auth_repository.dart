import 'dart:convert';
import 'package:cloud_app/data_layer/data_providers/auth_provider.dart';
import 'package:cloud_app/data_layer/models/registration_response_model.dart';
import 'package:cloud_app/data_layer/models/user_registration_model.dart';
import 'package:http/http.dart';


class AuthRepository {

  Future<Map<String, dynamic>> createNewAccount({required UserRegistrationModel user}) async {
    Response response = await AuthProvider.createNewAccount(user: user);
    RegistrationResponseModel responseModel = RegistrationResponseModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    if (response.statusCode == 200) {
      return {'message' : responseModel.message};
    } else {
      return throw Exception({'error' : responseModel.message});
    }
  }
}