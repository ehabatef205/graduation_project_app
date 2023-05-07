import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/admin/create_department/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class CreateDepartmentCubit extends Cubit<CreateDepartmentStates> {
  CreateDepartmentCubit() : super(CreateDepartmentInitialState());

  static CreateDepartmentCubit get(context) => BlocProvider.of(context);
  TextEditingController departmentIdController = TextEditingController();
  TextEditingController departmentNameController = TextEditingController();
  TextEditingController departmentDesController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
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

  Future<void> addDepartment({required BuildContext context}) async {
    try {
      isLoading = true;
      emit(CreateDepartmentState());
      DioHelper.postData(
        url: "/api/department/create_department",
        data: {
          'department_id': departmentIdController.text,
          'image': img64,
          'department_name': departmentNameController.text,
          'department_description': departmentDesController.text,
        },
      ).then((value) {
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        emit(CreateDepartmentSuccessState());
        Navigator.pop(context);
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateDepartmentErrorState());
      });
    } catch (e) {}
  }
}
