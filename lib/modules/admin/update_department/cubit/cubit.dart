import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/update_department/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDepartmentCubit extends Cubit<UpdateDepartmentStates> {
  UpdateDepartmentCubit() : super(UpdateDepartmentInitialState());

  static UpdateDepartmentCubit get(context) => BlocProvider.of(context);
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

  void completeText({required Respone respone}) {
    departmentIdController.text = respone.departmentId!;
    departmentNameController.text = respone.departmentName!;
    departmentDesController.text = respone.departmentDescription!;
  }

  Future<void> updateDepartment(
      {required BuildContext context, required String departmentId}) async {
    try {
      isLoading = true;
      emit(UpdateDepartmentState());
      DioHelper.putData(
        url: "/api/department/update_department",
        data: {
          'department_id': departmentId,
          'department_name': departmentNameController.text,
          'department_description': departmentDesController.text,
          'image': image == null ? "" : img64,
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
        emit(UpdateDepartmentSuccessState());
        Navigator.pop(context);
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(UpdateDepartmentErrorState());
      });
    } catch (e) {}
  }

  Future<void> deleteDepartment(
      {required String departmentId, required BuildContext context}) async {
    try {
      emit(DeleteDepartmentLoadingState());
      DioHelper.deleteData(
        url: "/api/department/delete_department",
        data: {
          'department_id': departmentId,
        },
      ).then((value) async {
        print("Hello ${value.data}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppScreen(
                    userType: management!.userType!, indexOfScreen: 1)));
        emit(DeleteDepartmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(DeleteDepartmentErrorState());
      });
    } catch (e) {}
  }
}
