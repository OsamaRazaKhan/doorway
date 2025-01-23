class ECUserDetails {
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

  ECUserDetails.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    email = map['email'];
    username = map['username'];
    dob = map['date_of_birth'].toString().split(" ")[0];
    photo = map['photo'];
    interestedIn = map['interested_in'];
    //this.deviceName = map['device_name'];
    //this.deviceID = map['device_id'];
  }
}
