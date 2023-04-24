import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_Student/cubit/states.dart';



class CreateStudentCubit extends Cubit<CreateStudentStates> {
  CreateStudentCubit() : super(CreateStudentInitialState());

  static CreateStudentCubit get(context) => BlocProvider.of(context);
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentEmailController = TextEditingController();
  TextEditingController studentPasswordController = TextEditingController();
  TextEditingController studentBirthDayController = TextEditingController();
  TextEditingController studentPhoneController = TextEditingController();
  TextEditingController studentMobileController = TextEditingController();
  TextEditingController studentNATIDController = TextEditingController();
  TextEditingController studentAddressController = TextEditingController();
  TextEditingController studentDepartmentController = TextEditingController();
  TextEditingController studentLevelController = TextEditingController();
  TextEditingController studentHighSchoolController = TextEditingController();

  bool isPassword = true;

  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangeState());
  }
}