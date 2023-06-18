import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/doctor/create_post_doctor/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/view_posts_course_doctor/view_posts_course_doctor_screen.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostDoctorCubit extends Cubit<CreatePostDoctorStates> {
  CreatePostDoctorCubit() : super(CreatePostDoctorInitialState());

  static CreatePostDoctorCubit get(context) => BlocProvider.of(context);
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

  Future<void> addPost({required BuildContext context, required String courseId}) async{
    try {
      isLoading = true;
      emit(CreatePostState());
      DioHelper.postData(
        url: "/api/posts/create_post",
        data: {
          'text': postNameController.text,
          'image': img64,
          'department': management!.department,
          'course_id': courseId,
          "management_id": management!.managementId,
          "management_name": management!.name,
          "management_image": management!.image,
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPostsCourseDoctorScreen(course_id: courseId)));
        emit(CreatePostSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreatePostErrorState());
      });
    } catch (e) {}
  }
}