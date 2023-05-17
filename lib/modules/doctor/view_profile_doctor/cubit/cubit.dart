import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/view_profile_doctor/cubit/states.dart';
import 'package:image_picker/image_picker.dart';


class ViewProfileDoctorCubit extends Cubit<ViewProfileDoctorStates>{
  ViewProfileDoctorCubit() : super(ViewProfileDoctorInitialState());
  static ViewProfileDoctorCubit get(context) => BlocProvider.of(context);

  XFile? image;

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ChangeImageState());
  }
}