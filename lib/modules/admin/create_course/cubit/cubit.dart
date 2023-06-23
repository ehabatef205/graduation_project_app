import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/courses/courses_screen.dart';
import 'package:graduation_project_app/modules/admin/create_course/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class CreateCourseCubit extends Cubit<CreateCourseStates> {
  CreateCourseCubit() : super(CreateCourseInitialState());

  static CreateCourseCubit get(context) => BlocProvider.of(context);
  TextEditingController courseIdController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDesController = TextEditingController();
  TextEditingController courseCreditController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController courseLevelController = TextEditingController();
  List<int> level = [1, 2, 3, 4];
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isLoading = false;
  XFile? image;
  String img64 = '';

  void changeLevel(int selectLevel) async {
    courseLevelController.text = selectLevel.toString();

    emit(ChangeLevelState());
  }

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

  Future<void> addDepartment({required BuildContext context, required Respone department}) async {
    try {
      isLoading = true;
      emit(CreateCourseState());
      DioHelper.postData(
        url: "/api/course/create_course",
        data: {
          "course_id": courseIdController.text,
          "image": img64,
          "course_name": courseNameController.text,
          "course_description": courseDesController.text,
          "course_credit": courseCreditController.text,
          "course_level": courseLevelController.text,
          "department": department.departmentId,
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesScreen(department: department)));
        emit(CreateCourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateCourseErrorState());
      });
    } catch (e) {}
  }
}