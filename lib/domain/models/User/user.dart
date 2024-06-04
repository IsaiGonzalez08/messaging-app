class UserModel {
  String id, name, lastname, email;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
    };
  }
}
