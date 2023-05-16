import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/student_quiz/cubit/states.dart';

class StudentQuizCubit extends Cubit<StudentQuizStates>{
  StudentQuizCubit() : super(StudentQuizInitialState());

  static StudentQuizCubit get(context) => BlocProvider.of(context);
  TextEditingController addCommentController = TextEditingController();
}