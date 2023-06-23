import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/admin/update_student_profile/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_students/view_student.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateStudentProfileCubit extends Cubit<UpdateStudentProfileStates> {
  UpdateStudentProfileCubit() : super(UpdateStudentProfileInitialState());

  static UpdateStudentProfileCubit get(context) => BlocProvider.of(context);

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

  void completeText({required Data studentDate}) {
    emailController.text = studentDate!.email!;
    addressController.text = studentDate!.address!;
    phoneController.text = studentDate!.phone!;
    mobileController.text = studentDate!.mobile!;
  }

  void updateProfileStudent({required BuildContext context, required Data studentDate}) {
    try {
      isLoading = true;
      emit(UpdateLoadingState());
      DioHelper.patchData(
        token: loginManagementModel!.token,
        url: "/api/management/update_student",
        data: {
          'student_id': studentDate.studentId,
          'email': emailController.text,
          'phone': phoneController.text,
          'mobile': mobileController.text,
          'address': addressController.text,
          'image': image == null ? "" : img64,
        },
      ).then((value) {
        studentDate.email = emailController.text;
        studentDate.address = addressController.text;
        studentDate.phone = phoneController.text;
        studentDate.mobile = mobileController.text;
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

  Future<void> deleteStudent({required String studentId, required BuildContext context}) async {
    try {
      emit(DeleteStudentLoadingState());
      DioHelper.deleteData(
        url: "/api/management/delete_student",
        data: {
          'student_id': studentId,
        },
      ).then((value) async{
        print("Hello ${value.data}");
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewStudentsScreen()));
        emit(DeleteStudentSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(DeleteStudentErrorState());
      });
    } catch (e) {}
  }
}
