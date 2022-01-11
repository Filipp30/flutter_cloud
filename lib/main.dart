import 'package:cloud_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:cloud_app/ui/pages/auth/auth-components/auth_login_component.dart';
import 'package:cloud_app/ui/pages/auth/auth-components/auth_register_component.dart';
import 'package:cloud_app/ui/pages/home_page.dart';
import 'package:cloud_app/ui/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context)=> AuthBloc()),
      ],
      child: MaterialApp(
        title: 'Storage App',
        theme: ThemeData(
          fontFamily: 'RobotoCondensed Regular',
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),
        routes: {
          LandingPage.routeName: (context) => LandingPage(),
          AuthLoginComponent.routeName: (context) => AuthLoginComponent(),
          AuthRegisterComponent.routeName: (context) => AuthRegisterComponent(),
          HomePage.routeName: (context) => HomePage(),
        },
      ),
    );
  }
}

