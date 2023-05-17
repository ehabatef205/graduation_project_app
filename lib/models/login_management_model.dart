class LoginManagementModel {
  String? userType;
  String? message;
  Management? data;
  String? token;

  LoginManagementModel({this.userType, this.message, this.data, this.token});

  LoginManagementModel.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    message = json['message'];
    data = json['data'] != null ? Management.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_type'] = userType;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Management {
  String? sId;
  String? managementId;
  String? name;
  String? email;
  String? password;
  String? birthDay;
  String? phone;
  String? mobile;
  String? image;
  String? department;
  String? joinDate;
  String? lastLogin;
  String? nATId;
  String? address;
  String? userType;
  int? iV;

  Management(
      {this.sId,
        this.managementId,
        this.name,
        this.email,
        this.password,
        this.birthDay,
        this.phone,
        this.mobile,
        this.image,
        this.department,
        this.joinDate,
        this.lastLogin,
        this.nATId,
        this.address,
        this.userType,
        this.iV});

  Management.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    managementId = json['management_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthDay = json['birth_day'];
    phone = json['phone'];
    mobile = json['mobile'];
    image = json['image'];
    department = json['department'];
    joinDate = json['join_date'];
    lastLogin = json['last_login'];
    nATId = json['NAT_id'];
    address = json['address'];
    userType = json['user_type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['management_id'] = managementId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birth_day'] = birthDay;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['image'] = image;
    data['department'] = department;
    data['join_date'] = joinDate;
    data['last_login'] = lastLogin;
    data['NAT_id'] = nATId;
    data['address'] = address;
    data['user_type'] = userType;
    data['__v'] = iV;
    return data;
  }
}