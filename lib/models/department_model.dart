class DepartmentModel {
  List<Respone>? respone;

  DepartmentModel({this.respone});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['respone'] != null) {
      respone = <Respone>[];
      json['respone'].forEach((v) {
        respone!.add(new Respone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.respone != null) {
      data['respone'] = this.respone!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Respone {
  String? sId;
  String? departmentId;
  String? departmentName;
  String? departmentDescription;
  int? iV;
  String? image;

  Respone(
      {this.sId,
        this.departmentId,
        this.departmentName,
        this.departmentDescription,
        this.iV,
        this.image});

  Respone.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    departmentDescription = json['department_description'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['department_description'] = this.departmentDescription;
    data['__v'] = this.iV;
    data['image'] = this.image;
    return data;
  }
}