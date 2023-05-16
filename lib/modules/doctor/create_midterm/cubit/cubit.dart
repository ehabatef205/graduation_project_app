import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/states.dart';

class CreateMidTermCubit extends Cubit<CreateMidTermStates> {
  CreateMidTermCubit() : super(CreateMidTermInitialState());

  static CreateMidTermCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController gradesController = TextEditingController();
  TextEditingController addCommentController = TextEditingController();
}