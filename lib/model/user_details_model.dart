class UserDetailsModel {
  int id = 0;
  String? name;
  String? phone;
  String? email;
  String? username;
  String? dob;
  String? photo;
  String? interestedIn;

  //String? deviceName;
  //String? deviceID;

  UserDetailsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    name = map['name']?.toString() ?? "";
    phone = map['phone']?.toString() ?? "";
    email = map['email']?.toString() ?? "";
    username = map['username']?.toString() ?? "";
    dob = map['date_of_birth']?.toString().split(" ")[0] ?? "";
    photo = map['photo']?.toString() ?? "";
    interestedIn = map['interested_in']?.toString() ?? "";
    //this.deviceName = map['device_name'];
    //this.deviceID = map['device_id'];
  }
}
