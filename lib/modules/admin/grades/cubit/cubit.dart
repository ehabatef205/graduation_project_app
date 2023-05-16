import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/grades/cubit/states.dart';

class AdminGradesCubit extends Cubit<AdminGradesStates>{
  AdminGradesCubit() : super(AdminGradesInitialState());

  static AdminGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
}