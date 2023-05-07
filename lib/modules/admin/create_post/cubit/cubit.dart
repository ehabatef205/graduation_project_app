import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/admin/create_post/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit() : super(CreatePostInitialState());

  static CreatePostCubit get(context) => BlocProvider.of(context);
  TextEditingController postNameController = TextEditingController();
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

  Future<void> addPost({required BuildContext context}) async{
    try {
      isLoading = true;
      emit(CreatePostState());
      DioHelper.postData(
        url: "/api/posts/create_post",
        data: {
          'text': postNameController.text,
          'image': img64,
          'department': "admin",
          'course_id': "admin",
          "management_id": loginManagementModel!.data!.managementId,
          "management_name": loginManagementModel!.data!.name,
          "management_image": loginManagementModel!.data!.image,
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
        Navigator.pop(context);
        emit(CreatePostSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreatePostErrorState());
      });
    } catch (e) {}
  }
}