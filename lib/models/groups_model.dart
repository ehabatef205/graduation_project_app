class GroupsModel {
  List<Respone>? respone;

  GroupsModel({this.respone});

  GroupsModel.fromJson(Map<String, dynamic> json) {
    if (json['respone'] != null) {
      respone = <Respone>[];
      json['respone'].forEach((v) {
        respone!.add(Respone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.respone != null) {
      data['respone'] = this.respone!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Respone {
  Teacher? teacher;
  Session? session;
  String? sId;
  String? courseId;
  int? groupNumber;
  int? numberOfStudent;
  List<String>? students;
  int? iV;

  Respone(
      {this.teacher,
        this.session,
        this.sId,
        this.courseId,
        this.groupNumber,
        this.numberOfStudent,
        this.students,
        this.iV});

  Respone.fromJson(Map<String, dynamic> json) {
    teacher =
    json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
    session =
    json['session'] != null ? Session.fromJson(json['session']) : null;
    sId = json['_id'];
    courseId = json['course_id'];
    groupNumber = json['group_number'];
    numberOfStudent = json['number_of_student'];
    students = json['students'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (session != null) {
      data['session'] = session!.toJson();
    }
    data['_id'] = sId;
    data['course_id'] = courseId;
    data['group_number'] = groupNumber;
    data['number_of_student'] = numberOfStudent;
    data['students'] = students;
    data['__v'] = iV;
    return data;
  }
}

class Teacher {
  String? teacherId;
  String? time;
  int? hall;

  Teacher({this.teacherId, this.time, this.hall});

  Teacher.fromJson(Map<String, dynamic> json) {
    teacherId = json['teacher_id'];
    time = json['time'];
    hall = json['hall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id'] = teacherId;
    data['time'] = time;
    data['hall'] = hall;
    return data;
  }
}

class Session {
  String? teacherIdSession;
  String? timeSession;
  int? hallSession;

  Session({this.teacherIdSession, this.timeSession, this.hallSession});

  Session.fromJson(Map<String, dynamic> json) {
    teacherIdSession = json['teacher_id_session'];
    timeSession = json['time_session'];
    hallSession = json['hall_session'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacher_id_session'] = teacherIdSession;
    data['time_session'] = timeSession;
    data['hall_session'] = hallSession;
    return data;
  }
}