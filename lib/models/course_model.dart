class CourseModel {
  List<Course>? course;

  CourseModel({this.course});

  CourseModel.fromJson(Map<String, dynamic> json) {
    if (json['respone'] != null) {
      course = <Course>[];
      json['respone'].forEach((v) {
        course!.add(Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (course != null) {
      data['respone'] = course!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  String? sId;
  String? courseId;
  String? courseName;
  String? image;
  String? department;
  String? courseDescription;
  String? courseCredit;
  String? courseLevel;
  List<dynamic>? finalGrads;
  int? iV;

  Course(
      {this.sId,
        this.courseId,
        this.courseName,
        this.department,
        this.courseDescription,
        this.courseCredit,
        this.courseLevel,
        this.image,
        this.finalGrads,
        this.iV});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseId = json['course_id'];
    courseName = json['course_name'];
    courseDescription = json['course_description'];
    courseCredit = json['course_credit'];
    courseLevel = json['course_level'];
    image = json['image'];
    department = json['department'];
    finalGrads = json['final_grads'].cast<List<dynamic>>();
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