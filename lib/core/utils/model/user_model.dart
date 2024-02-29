// ignore_for_file: non_constant_identifier_names
class UserModel {
  late String name;
  late String phone;
  late String email;
  late String uId;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];

    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
    };
  }
}
