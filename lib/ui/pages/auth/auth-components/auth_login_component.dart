import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../../spinners/spinnerCircular.dart';
import 'auth_register_component.dart';
import 'form_validators.dart';

class AuthLoginComponent extends StatefulWidget with InputTextFieldValidators{
  static const routeName = 'auth-login-component';
  @override
  State<AuthLoginComponent> createState() => _AuthLoginComponentState();
}

class _AuthLoginComponentState extends State<AuthLoginComponent> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _emailErrorEnable = false;
  late bool _passwordErrorEnabled = false;

  late bool _spinnerEnabled= false;
  late bool _inputEnabled = true;

  bool validateInputs(){
    setState(() {
      _emailErrorEnable = !widget.validator.emailIsValid(_emailController.text);
      _passwordErrorEnabled = !widget.validator.passwordIsValid(_passwordController.text);
    });
    if (_emailErrorEnable || _passwordErrorEnabled) {
      return false;
    } else {
      return true;
    }
  }

  void _submit() {
    late bool validated = validateInputs();
    if (validated) {
      print('Confirmation is true... NO ERRORS !!!');
    } else {
      print ('VALIDATION FAILS');
    }
  }

  void _switchToRegisterPage(){
    Navigator.pushReplacementNamed(context, AuthRegisterComponent.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: activeColor1)),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: activeColor1 ),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.app_registration_rounded, color: activeColor1), onPressed: ()=>_switchToRegisterPage())
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      _buildEmailField(),
                      const SizedBox(height: 10),
                      _buildPasswordField(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextButton.icon(
                  label: Text('Login',
                      style: TextStyle(
                          color: activeColor1,
                          fontSize: 20,
                          fontFamily: 'RobotoCondensed Italic')),
                  icon: Icon(Icons.login, color: activeColor1),
                  onPressed: ()=>_submit(),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Spinner(),
                )
              ],
            )
        ),
      ),
    );
  }

  ClayContainer _buildEmailField() {
    return ClayContainer(
      color: primaryColor,
      parentColor: primaryColor,
      emboss: true,
      borderRadius: 20,
      height: 50,
      child: TextFormField(
        controller: _emailController,
        style: TextStyle(fontSize: 20,color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border:InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.email, color: activeColor1),
          suffixIcon: _emailErrorEnable ? const Icon(Icons.error, color: Colors.red) : null,
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 16, color: activeColor1, decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (value){setState(() {_emailErrorEnable = false;});},
      ),
    );
  }

  ClayContainer _buildPasswordField() {
    return ClayContainer(
      color: primaryColor,
      parentColor: primaryColor,
      emboss: true,
      borderRadius: 20,
      height: 50,
      child: TextFormField(
        controller: _passwordController,
        style: TextStyle(fontSize: 20,color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border:InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.password_outlined, color: activeColor1),
          suffixIcon: _passwordErrorEnabled ? const Icon(Icons.error, color: Colors.red) : null,
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 16, color: activeColor1, decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onEditingComplete: _submit,
        onChanged: (value){setState(() {_passwordErrorEnabled = false;});},
      ),
    );
  }
}

