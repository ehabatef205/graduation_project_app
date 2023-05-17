import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/doctor/update_profile_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileDoctorCubit extends Cubit<UpdateProfileDoctorStates> {
  UpdateProfileDoctorCubit() : super(UpdateProfileDoctorInitialState());

  static UpdateProfileDoctorCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  XFile? image;
  String img64 = '';

  void chooseImage() async {
    image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    File imagefile = File(image!.path);

    Uint8List bytes = await imagefile.readAsBytes();

    img64 = "data:image/jpeg;base64,${base64.encode(bytes)}";

    print(img64);

    emit(ChangeImageState());
  }

  void completeText() {
    emailController.text = management!.email!;
    addressController.text = management!.address!;
    phoneController.text = management!.phone!;
    mobileController.text = management!.mobile!;
  }

  void updateProfileDoctor({required BuildContext context}) {
    try {
      isLoading = true;
      emit(UpdateLoadingState());
      DioHelper.patchData(
        token: loginManagementModel!.token,
        url: "/api/management/update_management",
        data: {
          'management_id': management!.managementId,
          'email': emailController.text,
          'phone': phoneController.text,
          'mobile': mobileController.text,
          'address': addressController.text,
          'image': image == null ? "" : img64,
        },
      ).then((value) {
        management!.email = emailController.text;
        management!.address = addressController.text;
        management!.phone = phoneController.text;
        management!.mobile = mobileController.text;
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        Navigator.pop(context);
        emit(UpdateSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(UpdateErrorState());
      });
    } catch (e) {}
  }
}
