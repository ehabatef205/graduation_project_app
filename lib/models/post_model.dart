class PostModel {
  List<Respone>? respone;

  PostModel({this.respone});

  PostModel.fromJson(Map<String, dynamic> json) {
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
  String? text;
  String? image;
  String? courseId;
  String? dateTime;
  String? department;
  List<Comments>? comments;
  String? managementId;
  String? managementName;
  String? managementImage;
  bool? hidden;
  int? iV;

  Respone(
      {this.sId,
        this.text,
        this.image,
        this.courseId,
        this.dateTime,
        this.department,
        this.comments,
        this.managementId,
        this.managementName,
        this.managementImage,
        this.hidden,
        this.iV});

  Respone.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    image = json['image'];
    courseId = json['courseId'];
    dateTime = json['date_time'];
    department = json['department'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    managementId = json['management_id'];
    managementName = json['management_name'];
    managementImage = json['management_image'];
    hidden = json['hidden'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['image'] = this.image;
    data['courseId'] = this.courseId;
    data['date_time'] = this.dateTime;
    data['department'] = this.department;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['management_id'] = this.managementId;
    data['management_name'] = this.managementName;
    data['management_image'] = this.managementImage;
    data['hidden'] = this.hidden;
    data['__v'] = this.iV;
    return data;
  }
}

class Comments {
  String? id;
  String? name;
  String? image;
  String? text;
  String? date;
  String? sId;

  Comments({this.id, this.name, this.image, this.text, this.date, this.sId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    text = json['text'];
    date = json['date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['text'] = this.text;
    data['date'] = this.date;
    data['_id'] = this.sId;
    return data;
  }
}