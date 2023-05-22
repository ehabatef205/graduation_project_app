import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/student/register_course/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class RegisterCourseCubit extends Cubit<RegisterCourseStates> {
  RegisterCourseCubit() : super(RegisterCourseInitialState());

  static RegisterCourseCubit get(context) => BlocProvider.of(context);

  List<String> list = ["Hi", "Hello"];

  bool isLoading = false;

  bool isLoading2 = false;

  String? courseSelect;

  int? groupSelect;

  CourseModel? courses;

  GroupsModel? groups;

  List<String> coursesId = [];

  List<int> groupsNumber = [];

  bool isViewGroups = false;

  bool isViewCourse = false;

  void changeView() {
    isViewCourse = !isViewCourse;
    print(isViewCourse);
    emit(ViewCourseState());
  }

  void changeCourse(String selectCourse) async {
    courseSelect = selectCourse;
    getGroups();
    emit(ChangeCourseState());
  }

  void changeGroup(int selectCourse) async {
    groupSelect = selectCourse;
    emit(ChangeCourseState());
  }

  Future<void> getCourses() async {
    try {
      isLoading = true;
      emit(CourseLoadingState());
      DioHelper.postData(
          url: "/api/course/view_course_by_department",
          data: {"department": student!.department}).then((value) {
        courses = CourseModel.fromJson(value.data);
        for (int i = 0; i < courses!.respone!.length; i++) {
          if (courses!.respone![i].courseLevel == student!.level) {
            coursesId.add(courses!.respone![i].courseId!);
          }
        }
        isLoading = false;
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(CourseErrorState());
      });
    } catch (e) {}
  }

  Future<void> getGroups() async {
    try {
      groupsNumber.clear();
      groupSelect = null;
      groups = null;
      isViewGroups = false;
      emit(CourseLoadingState());
      DioHelper.postData(
          url: "/api/groups/view_group_by_id",
          data: {"course_id": courseSelect}).then((value) {
        groups = GroupsModel.fromJson(value.data);
        for (int i = 0; i < groups!.respone!.length; i++) {
          groupsNumber.add(groups!.respone![i].groupNumber!);
        }
        isViewGroups = true;
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isViewGroups = false;
        emit(CourseErrorState());
      });
    } catch (e) {}
  }

  Future<void> registerCourse({required BuildContext context}) async {
    try {
      isLoading2 = true;
      emit(CourseLoadingState());
      DioHelper.postData(
              url: "/api/registration/register",
              data: {"course_id": courseSelect, "group_number": groupSelect},
              token: token)
          .then((value) {
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        isLoading2 = false;
        if (value.data["message"] == "Done Register") {
          Navigator.pop(context);
        }
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading2 = false;
        emit(CourseErrorState());
      });
    } catch (e) {}
  }

  Future<void> unregisterCourse(
      {required int index,
      required String course_id,
      required int group_number}) async {
    try {
      emit(CourseLoadingState());
      DioHelper.deleteData(
              url: "/api/registration/unregister",
              data: {"course_id": course_id, "group_number": group_number},
              token: token)
          .then((value) {
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        if (value.data["message"] == "unregister is done" ||
            value.data["message"] == "Done unregister") {
          student!.register!.removeAt(index);
        }
        emit(CourseSuccessState());
      });
    } catch (e) {}
  }
}
