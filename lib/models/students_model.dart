class StudentsModel {
  int? success;
  List<Data>? data;

  StudentsModel({this.success, this.data});

  StudentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? studentId;
  String? name;
  String? email;
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
  List<dynamic>? register;
  int? iV;

  Data(
      {this.sId,
      this.studentId,
      this.name,
      this.email,
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
      this.register,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['student_id'];
    name = json['name'];
    email = json['email'];
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
    register = json['register'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['student_id'] = studentId;
    data['name'] = name;
    data['email'] = email;
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
    data['register'] = register;
    data['__v'] = iV;
    return data;
  }
}

class Register {
  String? courseId;
  String? image;
  int? groupNumber;
  int? numberOfRegistration;
  bool? registrationCurrent;
  bool? pass;
  String? time;
  String? finalGrad;
  String? sId;

  Register(
      {this.courseId,
      this.image,
      this.groupNumber,
      this.numberOfRegistration,
      this.registrationCurrent,
      this.pass,
      this.time,
      this.finalGrad,
      this.sId});

  Register.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    image = json['image'];
    groupNumber = json['group_number'];
    numberOfRegistration = json['number_of_registration'];
    registrationCurrent = json['registration_current'];
    pass = json['pass'];
    time = json['time'];
    finalGrad = json['final_grad'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['course_id'] = courseId;
    data['image'] = image;
    data['group_number'] = groupNumber;
    data['number_of_registration'] = numberOfRegistration;
    data['registration_current'] = registrationCurrent;
    data['pass'] = pass;
    data['time'] = time;
    data['final_grad'] = finalGrad;
    data['_id'] = sId;
    return data;
  }
}
