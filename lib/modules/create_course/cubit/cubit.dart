import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_course/cubit/states.dart';

class CreateCourseCubit extends Cubit<CreateCourseStates> {
  CreateCourseCubit() : super(CreateCourseInitialState());

  static CreateCourseCubit get(context) => BlocProvider.of(context);
  TextEditingController courseIdController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDesController = TextEditingController();
  TextEditingController courseCreditController = TextEditingController();
  TextEditingController departementController = TextEditingController();
  TextEditingController courseLevelController = TextEditingController();
}