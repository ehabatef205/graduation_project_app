import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/view_student_profile/cubit/states.dart';
import 'package:image_picker/image_picker.dart';


class ViewStudentProfileCubit extends Cubit<ViewStudentProfileStates>{
  ViewStudentProfileCubit() : super(ViewStudentProfileInitialState());
  static ViewStudentProfileCubit get(context) => BlocProvider.of(context);

  XFile? image;

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ChangeImageState());
  }
}