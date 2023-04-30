import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/home_student/cubit/states.dart';

class HomeStudentCubit extends Cubit<HomeStudentStates> {
  HomeStudentCubit() : super(InitialHomeStudentState());

  static HomeStudentCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> list = [
    {
      "name": "admin",
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:40",
      "text": "Hallo Student, ",
      "post_image": "",
      "comments": [
        {
          "name": "name 1",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:41",
          "text": "I'm Fine"
        }
      ],
    },
    {
      "name": "doctor",
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:45",
      "text": "Hallo Student, How are you? I'm Admin 2",
      "post_image": "assets/back2.jpg",
      "comments": [
        {
          "name": "name 1",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:46",
          "text": "I'm Fine"
        },
        {
          "name": "name 2",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:46",
          "text": "I'm Fine"
        }
      ],
    },
    {
      "name": "doctor",
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:50",
      "text": "Hallo Student, How are you? I'm Admin 3",
      "post_image": "",
      "comments": [
        {
          "name": "name 1",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:51",
          "text": "I'm Fine"
        },
        {
          "name": "name 2",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:51",
          "text": "I'm Fine"
        },
        {
          "name": "name 3",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:51",
          "text": "I'm Fine"
        },
      ],
    },
    {
      "name": "admin",
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:55",
      "text": "Hallo Student, How are you? I'm Admin 4",
      "post_image": "",
      "comments": [
        {
          "name": "name 1",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:56",
          "text": "I'm Fine"
        },
        {
          "name": "name 2",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:56",
          "text": "I'm Fine"
        },
        {
          "name": "name 3",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:56",
          "text": "I'm Fine"
        },
        {
          "name": "name 4",
          "image": "assets/back2.jpg",
          "time": "2023/04/08 12:56",
          "text": "I'm Fine"
        },
      ],
    }
  ];

  List<Map<String, dynamic>> course = [
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

  List<String> post = ["Admin", "Department"];

  int index = 0;

  var controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexStudentState());
  }
}
