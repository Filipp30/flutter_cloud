import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:cloud_app/ui/spinners/spinner_linear.dart';
import 'package:flutter/material.dart';
import 'auth-components/auth_third_party_component.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text('Please Authenticate.', style: TextStyle(color: activeColor1)),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinnerLinear(),
                  const SizedBox(height: 60),
                  SizedBox(
                    child: Image.asset('assets/images/database_logo.jpeg',
                        width: 150, height: 150),
                  ),
                  const SizedBox(height: 60),
                  const AuthThirdPartyComponent(
                      signInMethod: AuthMethod.google),
                  const SizedBox(height: 30),
                  const AuthThirdPartyComponent(
                      signInMethod: AuthMethod.facebook),
                  const SizedBox(height: 30),
                  const AuthThirdPartyComponent(signInMethod: AuthMethod.email),
                ],
              ),
            ),
          ),
        ));
  }
}
