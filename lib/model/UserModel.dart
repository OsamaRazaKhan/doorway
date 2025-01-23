class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.phone,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    name = map['name']?.toString() ?? "";
    email = map['email']?.toString() ?? "";
    phone = map['phone']?.toString() ?? "";
    photo = map['photo']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photo': photo,
    };
  }
}
