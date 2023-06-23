import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/update_doctor_profile/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/view_doctors.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDoctorProfileCubit extends Cubit<UpdateDoctorProfileStates> {
  UpdateDoctorProfileCubit() : super(UpdateDoctorProfileInitialState());

  static UpdateDoctorProfileCubit get(context) => BlocProvider.of(context);

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

  void completeText({required Data doctorDate}) {
    emailController.text = doctorDate.email!;
    addressController.text = doctorDate.address!;
    phoneController.text = doctorDate.phone!;
    mobileController.text = doctorDate.mobile!;
  }

  void updateProfileDoctor({required BuildContext context, required Data doctorDate}) {
    try {
      isLoading = true;
      emit(UpdateLoadingState());
      DioHelper.patchData(
        token: loginManagementModel!.token,
        url: "/api/management/update_student",
        data: {
          'management_id': doctorDate.managementId,
          'email': emailController.text,
          'phone': phoneController.text,
          'mobile': mobileController.text,
          'address': addressController.text,
          'image': image == null ? "" : img64,
        },
      ).then((value) {
        doctorDate.email = emailController.text;
        doctorDate.address = addressController.text;
        doctorDate.phone = phoneController.text;
        doctorDate.mobile = mobileController.text;
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

  Future<void> deleteManagement({required String managementId, required BuildContext context}) async {
    try {
      emit(DeleteDoctorLoadingState());
      DioHelper.deleteData(
        url: "/api/management/delete_management",
        data: {
          'management_id': managementId,
        },
      ).then((value) async{
        print("Hello ${value.data}");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewDoctorsScreen()));
        emit(DeleteDoctorSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(DeleteDoctorErrorState());
      });
    } catch (e) {}
  }
}
