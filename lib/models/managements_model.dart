class ManagementsModel {
  int? success;
  List<Data>? data;

  ManagementsModel({this.success, this.data});

  ManagementsModel.fromJson(Map<String, dynamic> json) {
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
  String? managementId;
  String? name;
  String? email;
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