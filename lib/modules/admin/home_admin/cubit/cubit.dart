import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/home_admin/cubit/states.dart';

class HomeAdminCubit extends Cubit<HomeAdminStates> {
  HomeAdminCubit() : super(InitialHomeAdminState());

  static HomeAdminCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> list = [
    {
      "name": "admin",
      "hidden": false,
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:40",
      "text": "Hallo Admin, ",
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
      "hidden": true,
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:45",
      "text": "Hallo Admin, How are you? I'm Admin 2",
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
      "hidden": true,
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:50",
      "text": "Hallo Admin, How are you? I'm Admin 3",
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
      "hidden": true,
      "image": "assets/back2.jpg",
      "time": "2023/04/08 12:55",
      "text": "Hallo Admin, How are you? I'm Admin 4",
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

  void changeView(int index) {
    list[index]["hidden"] = !list[index]["hidden"];

    emit(ChangeViewAdminState());
  }
}
