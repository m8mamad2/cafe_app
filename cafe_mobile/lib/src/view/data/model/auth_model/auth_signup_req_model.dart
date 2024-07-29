class AuthSignupReqModel {
  String? email;
  String? password;
  String? userName;
  String? name;
  String? family;
  String? address;
  String? phoneNumber;

  AuthSignupReqModel(
      {this.email,
      this.password,
      this.userName,
      this.name,
      this.family,
      this.address,
      this.phoneNumber});

  AuthSignupReqModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    userName = json['userName'];
    name = json['name'];
    family = json['family'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['userName'] = userName;
    data['name'] = name;
    data['family'] = family;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
