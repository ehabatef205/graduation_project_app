import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/courses/cubit/states.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(InitialCoursesState());

  static CoursesCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> courses = [
    {
      "course_id": "Comp 402",
      "image": "assets/logo.png",
    },
    {
      "course_id": "Comp 403",
      "image": "assets/logo.png",
    },
    {
      "course_id": "Comp 490",
      "image": "assets/logo.png",
    },
    {
      "course_id": "Comp 494",
      "image": "assets/logo.png",
    },
  ];
}
