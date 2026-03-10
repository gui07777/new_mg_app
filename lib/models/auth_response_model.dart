class AuthResponseModel {
  final String accessToken;
  final String phone;
  final dynamic expiresIn;

  AuthResponseModel({
    required this.accessToken,
    required this.expiresIn,
    required this.phone,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] ?? '',
      expiresIn: json['expiresIn'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
