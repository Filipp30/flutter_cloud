class RegistrationResponseModel {
  String? _message;

  RegistrationResponseModel({String? message}) {
    if (message != null) {
      this._message = message;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    return data;
  }
}
