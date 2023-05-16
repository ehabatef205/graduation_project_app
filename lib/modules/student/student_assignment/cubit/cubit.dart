import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/student_assignment/cubit/states.dart';


class StudentAssignmentCubit extends Cubit<StudentAssignmentStates>{
  StudentAssignmentCubit() : super(StudentAssignmentInitialState());

  static StudentAssignmentCubit get(context) => BlocProvider.of(context);
}