part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthRegistrationSubmittedEvent extends AuthEvent{
  final UserRegistrationModel userRegistrationModel;
  AuthRegistrationSubmittedEvent({required this.userRegistrationModel});
}

