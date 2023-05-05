class LoginManagementModel {
  String? userType;
  String? message;
  Data? data;
  String? token;

  LoginManagementModel({this.userType, this.message, this.data, this.token});

  LoginManagementModel.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type'] = this.userType;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['management_id'] = this.managementId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birth_day'] = this.birthDay;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['department'] = this.department;
    data['join_date'] = this.joinDate;
    data['last_login'] = this.lastLogin;
    data['NAT_id'] = this.nATId;
    data['address'] = this.address;
    data['user_type'] = this.userType;
    data['__v'] = this.iV;
    return data;
  }
}