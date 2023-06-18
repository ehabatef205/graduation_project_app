import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_quiz_grades/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateQuizGradesCubit extends Cubit<CreateQuizGradesStates> {
  CreateQuizGradesCubit() : super(CreateQuizGradesInitialState());

  static CreateQuizGradesCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<dynamic> quizzes = [];

  void changeQuizAllStudents(List<dynamic> students) {
    for (int i = 0; i < students.length; i++) {
      quizzes.add({
        "student_id": students[i],
        "grad": "0"
      });
      emit(ChangeQuizAllStudentsState());
    }
  }

  void changeQuiz(int index, String grad) {
    quizzes[index] = grad;
    emit(ChangeQuizState());
  }

  Future<void> addQuiz({required Respone group, required BuildContext context}) async {
    try {
      print(quizzes);
      isLoading = true;
      emit(CreateQuizState());
      DioHelper.postData(
        url: "/api/groups/add_quizzes",
        data: {
          'course_id': group.courseId,
          'group_number': group.groupNumber,
          'quizzes': quizzes
        },
      ).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorQuizScreen(group: group)));
        emit(CreateQuizSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateQuizErrorState());
      });
    } catch (e) {}
  }
}
