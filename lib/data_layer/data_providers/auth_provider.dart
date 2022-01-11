import 'package:cloud_app/data_layer/models/user_registration_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider{
  static const String _baseUrl = 'https://61bd-81-11-139-169.ngrok.io';

  static Future<http.Response> createNewAccount({required UserRegistrationModel user}) async{
    Uri url =Uri.parse(_baseUrl+'/api/create-new-account');
    http.Response response = await http.post(
      url,
      body: {
        'name' : user.userName,
        'email' : user.email,
        'phone_number' : user.phoneNumber,
        'password' : user.password,
        'password_confirmation' : user.passwordConfirm,
      },
      headers: {
        'Accept' : 'application/json'
      }
    );
    return response;
  }
}


