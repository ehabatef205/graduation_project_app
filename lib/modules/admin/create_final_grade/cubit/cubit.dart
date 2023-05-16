import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_final_grade/cubit/states.dart';

class CreateFinalGradeCubit extends Cubit<CreateFinalGradeStates>{
  CreateFinalGradeCubit() : super(CreateFinalGradeInitialState());

  static CreateFinalGradeCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController finalGradeController = TextEditingController();
}