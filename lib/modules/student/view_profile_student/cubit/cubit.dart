import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/view_profile_student/cubit/states.dart';
import 'package:image_picker/image_picker.dart';


class ViewProfileStudentCubit extends Cubit<ViewProfileStudentStates>{
  ViewProfileStudentCubit() : super(ViewProfileStudentInitialState());
  static ViewProfileStudentCubit get(context) => BlocProvider.of(context);

  XFile? image;

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ChangeImageState());
  }
}