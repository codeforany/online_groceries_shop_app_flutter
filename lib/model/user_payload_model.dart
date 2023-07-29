class UserPayloadModel {
  int? userId;
  String? username;
  String? name;
  String? email;
  String? mobile;
  String? mobileCode;
  String? password;
  String? authToken;
  int? status;
  String? createdDate;

  UserPayloadModel(
      {this.userId,
      this.username,
      this.name,
      this.email,
      this.mobile,
      this.mobileCode,
      this.password,
      this.authToken,
      this.status,
      this.createdDate});

  UserPayloadModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    mobileCode = json['mobile_code'];
    password = json['password'];
    authToken = json['auth_token'];
    status = json['status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['mobile_code'] = this.mobileCode;
    data['password'] = this.password;
    data['auth_token'] = this.authToken;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    return data;
  }
}
