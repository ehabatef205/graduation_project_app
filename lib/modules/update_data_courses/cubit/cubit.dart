import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/update_data_courses/cubit/states.dart';
import 'package:graduation_project_app/modules/update_data_courses/update_data_courses_screen.dart';

class UpdateDataCoursesCubit extends Cubit<UpdateDataCoursesStates>{
  UpdateDataCoursesCubit() : super(UpdateDataCoursesInitialState());

  static UpdateDataCoursesCubit get(context) => BlocProvider.of(context);
  TextEditingController courseController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController teachingAssistantController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  void initialText(String courseName, String doctor, String teaching, int group){
    courseController.text = courseName;
    doctorController.text = doctor;
    teachingAssistantController.text = teaching;
    groupController.text = group.toString();
  }

}