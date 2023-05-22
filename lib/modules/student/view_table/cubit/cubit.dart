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
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
    ["", "", "", "", "", "", ""],
  ];

  bool isLoading = false;

  Future<void> getGroups() async {
    try {
      isLoading = true;
      emit(CourseLoadingState());
      for (int i = 0; i < student!.register!.length; i++) {
        Register register = Register.fromJson(student!.register![i]);
        if (register.registrationCurrent!) {
          DioHelper.postData(
            url: "/api/groups/view_group_by_course_id_and_group_number",
            data: {
              "course_id": register.courseId,
              "group_number": register.groupNumber
            },
          ).then((value) async{
            Respone group = Respone.fromJson(value.data["respone"]);
            table.add(group);
            emit(CourseSuccessState());
          }).catchError((error) {
            print(error.toString());
            isLoading = false;
            emit(CourseErrorState());
          }).whenComplete(() async{
            print("Hello");
            await getCoursesOfDay(table).whenComplete((){
              isLoading = false;
              emit(DoneState());
            });
          });
        }
      }
    } catch (e) {}
  }

  Future<void> getCoursesOfDay(var table2) async{
    for (int i = 0; i < table2.length; i++) {
      List<String> timeLecture = table2[i].teacher!.time!.split(" ");
      List<String> timeSection = table2[i].session!.timeSession!.split(" ");
      if (timeLecture[0] == "sat" || timeSection[0] == "sat") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[0][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[0][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[0][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[0][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[0][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[0][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[0][6] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        }
      } else if (timeLecture[0] == "sun" || timeSection[0] == "sun") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[1][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[1][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[1][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[1][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[1][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[1][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[1][6] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        }
      } else if (timeLecture[0] == "mon" || timeSection[0] == "mon") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[2][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[2][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[2][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[2][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[2][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[2][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[2][6] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        }
      } else if (timeLecture[0] == "tue" || timeSection[0] == "tue") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[3][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[3][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[3][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[3][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[3][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[3][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[3][6] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        }
      } else if (timeLecture[0] == "wed" || timeSection[0] == "wed") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[4][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[4][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[4][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[4][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[4][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[4][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[4][6] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        }
      } else if (timeLecture[0] == "thu" || timeSection[0] == "thu") {
        if ("${timeLecture[1]} ${timeLecture[2]}" == "8 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 am") {
          list[5][0] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "10 am" ||
            "${timeSection[1]} ${timeSection[2]}" == "10 am") {
          list[5][1] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "12 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "12 pm") {
          list[5][2] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "2 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "2 pm") {
          list[5][3] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "4 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "4 pm") {
          list[5][4] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "6 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "6 pm") {
          list[5][5] =
              "${table2[i].courseId}\n${table2[i].groupNumber}\n${table2[i].teacher!.hall}";
        } else if ("${timeLecture[1]} ${timeLecture[2]}" == "8 pm" ||
            "${timeSection[1]} ${timeSection[2]}" == "8 pm") {
          list[5][6] =
              "${table[i].courseId}\n${table[i].groupNumber}\n${table[i].teacher!.hall}";
        }
      }
    }
    emit(FinalListState());
  }
}
