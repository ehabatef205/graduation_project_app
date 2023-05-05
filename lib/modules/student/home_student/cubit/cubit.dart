import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/post_model.dart';
import 'package:graduation_project_app/modules/student/home_student/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:graduation_project_app/shared/string_extension.dart';

class HomeStudentCubit extends Cubit<HomeStudentStates> {
  HomeStudentCubit() : super(InitialHomeStudentState());

  static HomeStudentCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> course = [
    {
      "course_id": "Comp 490",
      "image": "assets/logo.png",
    },
  ];

  List<String> post = ["Admin", loginStudentModel!.data!.department!.capitalize()];

  bool isLoading = true;
  PostModel? postModel;

  int index = 0;

  var controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changeIndex(int newIndex) {
    index = newIndex;
    emit(ChangeIndexStudentState());
  }

  Future<void> postOfAdmin() async {
    try {
      isLoading = true;
      emit(AdminPostLoadingState());
      DioHelper.postData(
        url: "/api/posts/view_post_by_department_student",
        data: {
          'department': "admin",
          'course_id': "admin",
        },
      ).then((value) {
        postModel = PostModel.fromJson(value.data);
        isLoading = false;
        emit(AdminPostSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(AdminPostErrorState());
      });
    } catch (e) {}
  }
}
