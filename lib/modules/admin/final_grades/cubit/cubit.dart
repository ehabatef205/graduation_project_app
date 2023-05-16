import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/states.dart';

class FinalGradesCubit extends Cubit<FinalGradesStates>{
  FinalGradesCubit() : super(FinalGradesInitialState());

  static FinalGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
}