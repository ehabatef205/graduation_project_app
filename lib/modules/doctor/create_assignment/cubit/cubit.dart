import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/cubit/states.dart';

class CreateAssignmentCubit extends Cubit<CreateAssignmentStates> {
  CreateAssignmentCubit() : super(CreateAssignmentInitialState());

  static CreateAssignmentCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController gradesController = TextEditingController();
  TextEditingController addCommentController = TextEditingController();
}