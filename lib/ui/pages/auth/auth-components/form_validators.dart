
abstract class FormValidator {
  bool userNameIsValid(String value);
  bool emailIsValid(String value);
  bool phoneNumberIsValid(String value);
  bool passwordIsValid(String value);
  bool passwordConfirmationIsValid(String pass, String confirm);
}

class Validators implements FormValidator {
  @override
  bool emailIsValid(String value) {
   return value.isNotEmpty;
  }

  @override
  bool passwordConfirmationIsValid(String pass, String confirm) {
   if (pass.isNotEmpty && confirm.isNotEmpty && pass == confirm) {
     return true;
   }else{
     return false;
   }
  }

  @override
  bool passwordIsValid(String value) {
    return value.isNotEmpty;
  }

  @override
  bool phoneNumberIsValid(String value) {
    return value.isNotEmpty;
  }

  @override
  bool userNameIsValid(String value) {
    return value.isNotEmpty;
  }
}

class InputTextFieldValidators {
  final FormValidator validator = Validators();
}

