import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/update_profile/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileInitialState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? image;

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ChangeImageState());
  }
}
