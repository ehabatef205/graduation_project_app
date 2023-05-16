import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/courses_grades/cubit/states.dart';

class CoursesGradesCubit extends Cubit<CoursesGradesStates>{
  CoursesGradesCubit() : super(CoursesGradesInitialState());

  static CoursesGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
}