import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class FinalGradesCubit extends Cubit<FinalGradesStates>{
  FinalGradesCubit() : super(FinalGradesInitialState());

  static FinalGradesCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  bool isLoading2 = false;

  List<dynamic> students = [];
  List<dynamic> grads = [];

  void changeQuizAllStudents(List<dynamic> studentsId) {
    for (int i = 0; i < studentsId.length; i++) {
      grads.add({
        "student_id": studentsId[i],
        "grad": "0"
      });
      emit(ChangeFinalAllStudentsState());
    }
  }

  void changeFinal(int index, String grad) {
    grads[index] = {
      "student_id": students[index],
      "grad": grad
    };
    print(grads[index]);
    emit(ChangeFinalState());
  }

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
        changeQuizAllStudents(students);
        isLoading = false;
        emit(StudentsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(StudentsErrorState());
      });
    } catch (e) {}
  }

  Future<void> addFinal({required String course_id, required BuildContext context}) async {
    try {
      isLoading2 = true;
      emit(CreateFinalState());
      DioHelper.postData(
        url: "/api/final/update_final_grad",
        data: {
          'course_id': course_id,
          'grads': grads,
        },
      ).then((value) {
        Navigator.pop(context);
        emit(CreateFinalSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading2 = false;
        emit(CreateFinalErrorState());
      });
    } catch (e) {}
  }
}