class LoginStudentModel {
  String? userType;
  String? message;
  Student? data;
  String? token;

  LoginStudentModel({this.userType, this.message, this.data, this.token});

  LoginStudentModel.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    message = json['message'];
    data = json['data'] != null ? Student.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_type'] = userType;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Student {
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

  Student(
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

  Student.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['student_id'] = studentId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['birth_day'] = birthDay;
    data['image'] = image;
    data['phone'] = phone;
    data['mobile'] = mobile;
    data['level'] = level;
    data['join_date'] = joinDate;
    data['last_login'] = lastLogin;
    data['NAT_id'] = nATId;
    data['address'] = address;
    data['department'] = department;
    data['HS_score'] = hSScore;
    data['user_type'] = userType;
    if (registerd != null) {
      data['registerd'] = registerd!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}
