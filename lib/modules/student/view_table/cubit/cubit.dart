import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/models/login_student_model.dart';
import 'package:graduation_project_app/modules/student/view_table/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewTableCubit extends Cubit<ViewTableStates> {
  ViewTableCubit() : super(ViewTableInitialState());

  static ViewTableCubit get(context) => BlocProvider.of(context);

  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu"];
  List<String> time = [
    "8 am",
    "10 am",
    "12 pm",
    "2 pm",
    "4 pm",
    "6 pm",
    "8 pm",
  ];

  List<Respone> table = [];

  List<List<String>> list = [
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
    ["", "", "", "", "", ""],
  ];

  bool isLoading = false;

  Future<void> getGroups() async {
    try {
      isLoading = true;
      emit(CourseLoadingState());
      if(student!.register!.isEmpty){
        isLoading = false;
        emit(DoneState());
      }
      for (int i = 0; i < student!.register!.length; i++) {
        Register register = Register.fromJson(student!.register![i]);
        if (register.registrationCurrent!) {
          DioHelper.postData(
            url: "/api/groups/view_group_by_course_id_and_group_number",
            data: {
              "course_id": register.courseId,
              "group_number": register.groupNumber
            },
          ).then((value) async {
            Respone group = Respone.fromJson(value.data["respone"]);
            table.add(group);
            emit(CourseSuccessState());
          }).catchError((error) {
            print(error.toString());
            isLoading = false;
            emit(CourseErrorState());
          }).whenComplete(() async {
            await getCoursesOfDay(table).whenComplete(() {
              isLoading = false;
              emit(DoneState());
            });
          });
        }else{
          isLoading = false;
          emit(DoneState());
        }
      }
    } catch (e) {}
  }

  Future<void> getCoursesOfDay(List<Respone> table2) async {
    for (int i = 0; i < table2.length; i++) {

      switch (table2[i].teacher!.time) {
        case "sat 8 am":
          list[0][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 10 am":
          list[1][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 12 pm":
          list[2][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 2 pm":
          list[3][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 4 pm":
          list[4][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 6 pm":
          list[5][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sat 8 pm":
          list[6][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 8 am":
          list[0][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 10 am":
          list[1][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 12 pm":
          list[2][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 2 pm":
          list[3][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 4 pm":
          list[4][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 6 pm":
          list[5][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "sun 8 pm":
          list[6][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 8 am":
          list[0][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 10 am":
          list[1][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 12 pm":
          list[2][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 2 pm":
          list[3][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 4 pm":
          list[4][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 6 pm":
          list[5][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "mon 8 pm":
          list[6][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 8 am":
          list[0][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 10 am":
          list[1][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 12 pm":
          list[2][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 2 pm":
          list[3][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 4 pm":
          list[4][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 6 pm":
          list[5][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "tue 8 pm":
          list[6][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 8 am":
          list[0][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 10 am":
          list[1][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 12 pm":
          list[2][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 2 pm":
          list[3][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 4 pm":
          list[4][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 6 pm":
          list[5][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "wed 8 pm":
          list[6][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 8 am":
          list[0][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 10 am":
          list[1][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 12 pm":
          list[2][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 2 pm":
          list[3][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 4 pm":
          list[4][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 6 pm":
          list[5][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
        case "thu 8 pm":
          list[6][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
          break;
      }

      switch (table2[i].session!.timeSession) {
        case "sat 8 am":
          list[0][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 10 am":
          list[1][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 12 pm":
          list[2][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 2 pm":
          list[3][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 4 pm":
          list[4][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 6 pm":
          list[5][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sat 8 pm":
          list[6][0] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 8 am":
          list[0][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 10 am":
          list[1][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 12 pm":
          list[2][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 2 pm":
          list[3][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 4 pm":
          list[4][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 6 pm":
          list[5][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "sun 8 pm":
          list[6][1] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 8 am":
          list[0][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 10 am":
          list[1][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 12 pm":
          list[2][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 2 pm":
          list[3][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 4 pm":
          list[4][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 6 pm":
          list[5][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "mon 8 pm":
          list[6][2] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 8 am":
          list[0][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 10 am":
          list[1][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 12 pm":
          list[2][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 2 pm":
          list[3][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 4 pm":
          list[4][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 6 pm":
          list[5][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "tue 8 pm":
          list[6][3] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 8 am":
          list[0][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 10 am":
          list[1][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 12 pm":
          list[2][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 2 pm":
          list[3][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 4 pm":
          list[4][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 6 pm":
          list[5][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "wed 8 pm":
          list[6][4] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 8 am":
          list[0][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 10 am":
          list[1][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 12 pm":
          list[2][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 2 pm":
          list[3][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 4 pm":
          list[4][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 6 pm":
          list[5][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
        case "thu 8 pm":
          list[6][5] =
          "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].session!.hallSession}";
          break;
      }
    }
    emit(FinalListState());
  }
}
