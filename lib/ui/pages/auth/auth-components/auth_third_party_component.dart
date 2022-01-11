import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'auth_login_component.dart';

enum AuthMethod { google, facebook, email }

extension Assets on AuthMethod {
  static Map<AuthMethod,Map<String,dynamic>> assets = {
    AuthMethod.google: {
      'image' : 'assets/images/google_icon.jpeg',
      'text' : 'Sign in with Google',
      'callBack' : (context){print('google callback');},
    },
    AuthMethod.facebook: {
      'image' : 'assets/images/facebook_icon.jpeg',
      'text' : 'Sign in with Facebook',
      'callBack' : (context){print('facebook callback');},
    },
    AuthMethod.email: {
      'image' : 'assets/images/email_icon.jpeg',
      'text' : 'Sign in with Email',
      'callBack' : (context){Navigator.of(context).pushNamed(AuthLoginComponent.routeName);} ,
    },
  };
  Map<String, dynamic>? get asset => assets[this];
}

class AuthThirdPartyComponent extends StatelessWidget {
  const AuthThirdPartyComponent({required this.signInMethod});
  final AuthMethod signInMethod;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        color: primaryColor,
        parentColor: primaryColor,
        borderRadius: 20,
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('${signInMethod.asset!['image']}',width: 35,height: 35),
              Text('${signInMethod.asset!['text']}', style: const TextStyle(fontSize: 18, fontFamily: 'RobotoCondensed Italic'),)
            ],
          ),
          onPressed: () {signInMethod.asset!['callBack']?.call(context); },
        )
    );
  }
}
