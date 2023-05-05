class LoginStudentModel {
  String? userType;
  String? message;
  Data? data;
  String? token;

  LoginStudentModel({this.userType, this.message, this.data, this.token});

  LoginStudentModel.fromJson(Map<String, dynamic> json) {
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
  String? studentId;
  String? name;
  String? email;
  String? password;
  String? birthDay;
  String? image;
  String? phone;
  String? mobile;
  String? level;
  String? joinDate;
  String? lastLogin;
  String? nATId;
  String? address;
  String? department;
  int? hSScore;
  String? userType;
  List<dynamic>? registerd;
  int? iV;

  Data(
      {this.sId,
      this.studentId,
      this.name,
      this.email,
      this.password,
      this.birthDay,
      this.image,
      this.phone,
      this.mobile,
      this.level,
      this.joinDate,
      this.lastLogin,
      this.nATId,
      this.address,
      this.department,
      this.hSScore,
      this.userType,
      this.registerd,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['student_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    birthDay = json['birth_day'];
    image = json['image'];
    phone = json['phone'];
    mobile = json['mobile'];
    level = json['level'];
    joinDate = json['join_date'];
    lastLogin = json['last_login'];
    nATId = json['NAT_id'];
    address = json['address'];
    department = json['department'];
    hSScore = json['HS_score'];
    userType = json['user_type'];
    registerd = json['registerd'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['student_id'] = this.studentId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birth_day'] = this.birthDay;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['level'] = this.level;
    data['join_date'] = this.joinDate;
    data['last_login'] = this.lastLogin;
    data['NAT_id'] = this.nATId;
    data['address'] = this.address;
    data['department'] = this.department;
    data['HS_score'] = this.hSScore;
    data['user_type'] = this.userType;
    if (this.registerd != null) {
      data['registerd'] = this.registerd!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}
