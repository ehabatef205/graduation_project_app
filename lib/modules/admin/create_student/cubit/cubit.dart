import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/create_student/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_students/view_student.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

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
  TextEditingController studentHighSchoolController = TextEditingController();

  bool isPassword = true;
  bool isLoading = false;
  bool isLoading2 = false;
  DepartmentModel? departments;
  List<String> departmentsId = [];

  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangeState());
  }

  Future<void> addStudent({required BuildContext context}) async {
    try {
      isLoading = true;
      emit(CreateStudentState());
      DioHelper.postData(
        url: "/api/management/create_student",
        data: {
          'student_id': studentIdController.text,
          'name': studentNameController.text,
          'email': studentEmailController.text,
          'password': studentPasswordController.text,
          "birth_day": studentBirthDayController.text,
          "phone": studentPhoneController.text,
          "mobile": studentMobileController.text,
          "NAT_id": studentNATIDController.text,
          "address": studentAddressController.text,
          "department": studentDepartmentController.text,
          "HS_score": studentHighSchoolController.text,
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
        if (value.data["message"] == "Student added successfully") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewStudentsScreen()));
        }else{
          isLoading = false;
        }
        emit(CreateStudentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateStudentErrorState());
      });
    } catch (e) {}
  }

  void changeLevel(String selectDepartment) async {
    studentDepartmentController.text = selectDepartment.toString();

    emit(ChangeDepartmentState());
  }

  Future<void> getDepartments() async {
    try {
      isLoading2 = true;
      emit(DepartmentLoadingState());
      DioHelper.getData(
        url: "/api/department/view_all_departments",
      ).then((value) {
        departments = DepartmentModel.fromJson(value.data);
        for(int i = 0; i < departments!.respone!.length; i++){
          departmentsId.add(departments!.respone![i].departmentId!);
        }
        isLoading2 = false;
        emit(DepartmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading2 = true;
        emit(DepartmentErrorState());
      });
    } catch (e) {}
  }
}
