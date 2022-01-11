part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthBaseState extends AuthState{}

class AuthSpinnerEnabledState extends AuthState{}

class AuthInputsEnabledState extends AuthState{}

class AuthRegistrationSuccessState extends AuthState{
  final String message;
  AuthRegistrationSuccessState({required this.message});
}

class AuthRegistrationErrorState extends AuthState{
  final String error;
  AuthRegistrationErrorState({required this.error});
}


