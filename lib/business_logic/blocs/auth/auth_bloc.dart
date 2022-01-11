import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_app/data_layer/models/user_registration_model.dart';
import 'package:cloud_app/data_layer/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthBaseState()) {
    AuthRepository authRepository = AuthRepository();

    on<AuthRegistrationSubmittedEvent>((event, emit) async {
      emit(AuthSpinnerEnabledState());
      try {
        final response = await authRepository.createNewAccount(user: event.userRegistrationModel);
        emit(AuthRegistrationSuccessState(message: response.toString()));
      } catch(e) {
        emit(AuthInputsEnabledState());
        emit(AuthRegistrationErrorState(error: e.toString()));
      }
    });
  }
}
