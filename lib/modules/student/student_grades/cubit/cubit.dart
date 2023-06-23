import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/student_grades/cubit/states.dart';

class StudentGradesCubit extends Cubit<StudentGradesStates>{
  StudentGradesCubit() : super(StudentGradesInitialState());

  static StudentGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isView = false;

  void changeView(){
    isView = !isView;
    emit(ChangeState());
  }
}