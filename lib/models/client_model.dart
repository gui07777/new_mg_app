class ClientModel {
  final String name;
  final String? socialName;
  final String phone;
  final String cpf;
  final String? email;
  final String? birthdate;
  bool? phoneBrl;

  ClientModel({
    required this.name,
    this.socialName,
    required this.phone,
    required this.cpf,
    this.email,
    this.birthdate,
    this.phoneBrl,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      name: json['name'],
      socialName: json['socialName'],
      phone: json['phone'],
      cpf: json['cpf'],
      email: json['email'],
      birthdate: json['birthdate'],
      phoneBrl: json['phoneBrl'],
    );
  }
}
