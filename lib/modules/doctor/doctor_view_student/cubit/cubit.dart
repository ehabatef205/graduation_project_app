import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/doctor_view_student/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class DoctorViewStudentCubit extends Cubit<DoctorViewStudentStates> {
  DoctorViewStudentCubit() : super(DoctorViewStudentInitialState());

  static DoctorViewStudentCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<dynamic> students = [];

  Future<void> getStudent({required String course_id}) async {
    try {
      isLoading = true;
      emit(StudentsLoadingState());
      DioHelper.postData(
        url: "/api/final/students_finals",
        data: {
          "course_id": course_id,
        }
      ).then((value) async {
        students = value.data["respone"];
        isLoading = false;
        emit(StudentsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(StudentsErrorState());
      });
    } catch (e) {}
  }
}