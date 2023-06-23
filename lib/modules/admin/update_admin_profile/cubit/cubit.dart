import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/update_admin_profile/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_admins/view_admins.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateAdminProfileCubit extends Cubit<UpdateAdminProfileStates> {
  UpdateAdminProfileCubit() : super(UpdateAdminProfileInitialState());

  static UpdateAdminProfileCubit get(context) => BlocProvider.of(context);

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

  void completeText({required Data adminDate}) {
    emailController.text = adminDate.email!;
    addressController.text = adminDate.address!;
    phoneController.text = adminDate.phone!;
    mobileController.text = adminDate.mobile!;
  }

  void updateProfileAdmin({required BuildContext context, required Data adminDate}) {
    try {
      isLoading = true;
      emit(UpdateLoadingState());
      DioHelper.patchData(
        token: loginManagementModel!.token,
        url: "/api/management/update_student",
        data: {
          'management_id': adminDate.managementId,
          'email': emailController.text,
          'phone': phoneController.text,
          'mobile': mobileController.text,
          'address': addressController.text,
          'image': image == null ? "" : img64,
        },
      ).then((value) {
        adminDate.email = emailController.text;
        adminDate.address = addressController.text;
        adminDate.phone = phoneController.text;
        adminDate.mobile = mobileController.text;
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
      emit(DeleteAdminLoadingState());
      DioHelper.deleteData(
        url: "/api/management/delete_management",
        data: {
          'management_id': managementId,
        },
      ).then((value) async{
        print("Hello ${value.data}");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAdminsScreen()));
        emit(DeleteAdminSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(DeleteAdminErrorState());
      });
    } catch (e) {}
  }
}
