import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/view_profile_admin/cubit/states.dart';
import 'package:image_picker/image_picker.dart';


class ViewProfileAdminCubit extends Cubit<ViewProfileAdminStates>{
  ViewProfileAdminCubit() : super(ViewProfileAdminInitialState());
  static ViewProfileAdminCubit get(context) => BlocProvider.of(context);

  XFile? image;

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ChangeImageState());
  }
}