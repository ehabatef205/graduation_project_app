import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/cubit/states.dart';


class StudentMidTermCubit extends Cubit<StudentMidTermStates>{
  StudentMidTermCubit() : super(StudentMidTermInitialState());

  static StudentMidTermCubit get(context) => BlocProvider.of(context);
}