import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_quiz_grades/cubit/states.dart';


class CreateQuizGradesCubit extends Cubit<CreateQuizGradesStates> {
  CreateQuizGradesCubit() : super(CreateQuizGradesInitialState());

  static CreateQuizGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController gradesController = TextEditingController();
  TextEditingController addCommentController = TextEditingController();
}