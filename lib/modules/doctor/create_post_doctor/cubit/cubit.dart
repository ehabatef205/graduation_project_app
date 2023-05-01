import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_post_doctor/cubit/states.dart';

class CreatePostDoctorCubit extends Cubit<CreatePostDoctorStates> {
  CreatePostDoctorCubit() : super(CreatePostDoctorInitialState());

  static CreatePostDoctorCubit get(context) => BlocProvider.of(context);
  TextEditingController postIdController = TextEditingController();
  TextEditingController postNameController = TextEditingController();
}