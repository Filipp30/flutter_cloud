import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_app/business_logic/blocs/auth/auth_bloc.dart';
import 'package:cloud_app/data_layer/models/user_registration_model.dart';
import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../spinners/spinnerCircular.dart';
import 'auth_login_component.dart';
import 'form_validators.dart';

class AuthRegisterComponent extends StatefulWidget
    with InputTextFieldValidators {
  static const routeName = 'auth-register-component';

  @override
  State<AuthRegisterComponent> createState() => _AuthRegisterComponentState();
}

class _AuthRegisterComponentState extends State<AuthRegisterComponent> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  late bool _userNameErrorEnable = false;
  late bool _emailErrorEnable = false;
  late bool _phoneNumberErrorEnable = false;
  late bool _passwordErrorEnabled = false;
  late bool _passwordConfirmErrorEnabled = false;

  bool validateInputs() {
    setState(() {
      _userNameErrorEnable =
          !widget.validator.userNameIsValid(_userNameController.text);
      _emailErrorEnable = !widget.validator.emailIsValid(_emailController.text);
      _phoneNumberErrorEnable =
          !widget.validator.phoneNumberIsValid(_phoneNumberController.text);
      _passwordErrorEnabled =
          !widget.validator.passwordIsValid(_passwordController.text);
      _passwordConfirmErrorEnabled = !widget.validator
          .passwordConfirmationIsValid(
              _passwordController.text, _passwordConfirmController.text);
    });
    if (_userNameErrorEnable ||
        _emailErrorEnable ||
        _phoneNumberErrorEnable ||
        _passwordErrorEnabled ||
        _passwordConfirmErrorEnabled) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _submit(AuthBloc authBloc) async {
    if (authBloc.state is! AuthSpinnerEnabledState ||
        authBloc.state is! AuthRegistrationSuccessState) {
      late bool validated = validateInputs();
      if (validated) {
        setState(() {
          _inputEnabled = false;
        });
        authBloc.add(AuthRegistrationSubmittedEvent(
            userRegistrationModel: UserRegistrationModel(
                userName: _userNameController.text,
                email: _emailController.text,
                phoneNumber: _phoneNumberController.text,
                password: _passwordController.text,
                passwordConfirm: _passwordConfirmController.text)));
      }
    }
  }

  void _switchToLoginPage() {
    Navigator.pushReplacementNamed(context, AuthLoginComponent.routeName);
  }

  late bool _inputEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Registration', style: TextStyle(color: activeColor1)),
        centerTitle: true,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: activeColor1),
        actions: [
          IconButton(
              icon: Icon(Icons.login, color: activeColor1),
              onPressed: () => _switchToLoginPage())
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
                  const SizedBox(height: 30),
                  _buildUserNameField(),
                  const SizedBox(height: 10),
                  _buildEmailField(),
                  const SizedBox(height: 10),
                  _buildPhoneNumberField(),
                  const SizedBox(height: 10),
                  _buildPasswordField(),
                  const SizedBox(height: 10),
                  _buildPasswordConfirmField(authBloc)
                ],
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: () => _submit(authBloc),
              label: Text('Register',
                  style: TextStyle(
                      color: activeColor1,
                      fontSize: 20,
                      fontFamily: 'RobotoCondensed Italic')),
              icon: Icon(Icons.app_registration, color: activeColor1),
            ),
            const SizedBox(height: 30),
            BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSpinnerEnabledState) {
                    return Center(child: Spinner());
                  }
                  if (state is AuthRegistrationSuccessState) {
                    return Center(
                        child: Text(state.message,
                            style: TextStyle(
                                fontSize: 20,
                                color: activeColor1,
                                overflow: TextOverflow.ellipsis)));
                  }
                  if (state is AuthRegistrationErrorState) {
                    return Center(
                        child: Text(state.error,
                            style: TextStyle(
                                fontSize: 20,
                                color: activeColor1,
                                overflow: TextOverflow.ellipsis)));
                  }
                  return Center(child: null);
                },
                listener: (context, state){
                  if (state is AuthInputsEnabledState){setState(() {_inputEnabled = true;});}
                }
            )
          ],
        )),
      ),
    );
  }

  ClayContainer _buildUserNameField() {
    return ClayContainer(
      color: primaryColor,
      parentColor: primaryColor,
      emboss: true,
      borderRadius: 20,
      height: 50,
      child: TextFormField(
        controller: _userNameController,
        style: TextStyle(
            fontSize: 20, color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.person, color: activeColor1),
          suffixIcon: _userNameErrorEnable
              ? const Icon(Icons.error, color: Colors.red)
              : null,
          hintText: 'UserName',
          hintStyle: TextStyle(
              fontSize: 16,
              color: activeColor1,
              decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          setState(() {
            _userNameErrorEnable = false;
          });
        },
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
        style: TextStyle(
            fontSize: 20, color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.email, color: activeColor1),
          suffixIcon: _emailErrorEnable
              ? const Icon(Icons.error, color: Colors.red)
              : null,
          hintText: 'Email',
          hintStyle: TextStyle(
              fontSize: 16,
              color: activeColor1,
              decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          setState(() {
            _emailErrorEnable = false;
          });
        },
      ),
    );
  }

  ClayContainer _buildPhoneNumberField() {
    return ClayContainer(
      color: primaryColor,
      parentColor: primaryColor,
      emboss: true,
      borderRadius: 20,
      height: 50,
      child: TextFormField(
        controller: _phoneNumberController,
        style: TextStyle(
            fontSize: 20, color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.phone, color: activeColor1),
          suffixIcon: _phoneNumberErrorEnable
              ? const Icon(Icons.error, color: Colors.red)
              : null,
          hintText: 'PhoneNumber',
          hintStyle: TextStyle(
              fontSize: 16,
              color: activeColor1,
              decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: false,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          setState(() {
            _phoneNumberErrorEnable = false;
          });
        },
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
        style: TextStyle(
            fontSize: 20, color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.password_outlined, color: activeColor1),
          suffixIcon: _passwordErrorEnabled
              ? const Icon(Icons.error, color: Colors.red)
              : null,
          hintText: 'Password',
          hintStyle: TextStyle(
              fontSize: 16,
              color: activeColor1,
              decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          setState(() {
            _passwordErrorEnabled = false;
          });
        },
      ),
    );
  }

  ClayContainer _buildPasswordConfirmField(AuthBloc authBloc) {
    return ClayContainer(
      color: primaryColor,
      parentColor: primaryColor,
      emboss: true,
      borderRadius: 20,
      height: 50,
      child: TextFormField(
        controller: _passwordConfirmController,
        style: TextStyle(
            fontSize: 20, color: activeColor1, overflow: TextOverflow.ellipsis),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, right: 15),
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.password_outlined, color: activeColor1),
          suffixIcon: _passwordConfirmErrorEnabled
              ? const Icon(Icons.error, color: Colors.red)
              : null,
          hintText: 'Confirm Password',
          hintStyle: TextStyle(
              fontSize: 16,
              color: activeColor1,
              decoration: TextDecoration.none),
        ),
        cursorColor: activeColor1,
        enabled: _inputEnabled,
        obscureText: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onEditingComplete: () => _submit(authBloc),
        onChanged: (value) {
          setState(() {
            _passwordConfirmErrorEnabled = false;
          });
        },
      ),
    );
  }
}
