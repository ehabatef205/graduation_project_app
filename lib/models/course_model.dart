class CourseModel {
  List<Respone>? respone;

  CourseModel({this.respone});

  CourseModel.fromJson(Map<String, dynamic> json) {
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
  String? courseId;
  String? courseName;
  String? image;
  String? department;
  String? courseDescription;
  String? courseCredit;
  String? courseLevel;
  int? iV;

  Respone(
      {this.sId,
        this.courseId,
        this.courseName,
        this.department,
        this.courseDescription,
        this.courseCredit,
        this.courseLevel,
        this.image,
        this.iV});

  Respone.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['course_id'];
    courseName = json['course_name'];
    courseDescription = json['course_description'];
    courseCredit = json['course_credit'];
    courseLevel = json['course_level'];
    image = json['image'];
    department = json['department'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['course_id'] = courseId;
    data['course_name'] = courseName;
    data['course_description'] = courseDescription;
    data['course_credit'] = courseCredit;
    data['course_level'] = courseLevel;
    data['image'] = image;
    data['department'] = department;
    data['__v'] = iV;
    return data;
  }
}