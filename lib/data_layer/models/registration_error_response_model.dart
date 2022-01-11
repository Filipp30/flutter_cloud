class RegistrationErrorResponseModel {
  String? _message;
  Errors? _errors;

  RegistrationErrorResponseModel({String? message, Errors? errors}) {
    if (message != null) {
      this._message = message;
    }
    if (errors != null) {
      this._errors = errors;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Errors? get errors => _errors;
  set errors(Errors? errors) => _errors = errors;

  RegistrationErrorResponseModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._errors != null) {
      data['errors'] = this._errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? _email;

  Errors({List<String>? email}) {
    if (email != null) {
      this._email = email;
    }
  }

  List<String>? get email => _email;
  set email(List<String>? email) => _email = email;

  Errors.fromJson(Map<String, dynamic> json) {
    _email = json['email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    return data;
  }
}
