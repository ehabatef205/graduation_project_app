import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/create_management/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_admins/view_admins.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/view_doctors.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateManagementCubit extends Cubit<CreateManagementStates> {
  CreateManagementCubit() : super(CreateManagementInitialState());

  static CreateManagementCubit get(context) => BlocProvider.of(context);
  TextEditingController managementIdController = TextEditingController();
  TextEditingController managementNameController = TextEditingController();
  TextEditingController managementEmailController = TextEditingController();
  TextEditingController managementPasswordController = TextEditingController();
  TextEditingController managementBirthDayController = TextEditingController();
  TextEditingController managementPhoneController = TextEditingController();
  TextEditingController managementMobileController = TextEditingController();
  TextEditingController managementNATIDController = TextEditingController();
  TextEditingController managementAddressController = TextEditingController();
  TextEditingController managementDepartmentController =
      TextEditingController();

  bool isPassword = true;
  bool isLoading = false;
  bool isLoading2 = false;
  DepartmentModel? departments;
  List<String> departmentsId = [];

  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangeState());
  }

  Future<void> addManagement(
      {required BuildContext context, required userType}) async {
    try {
      isLoading = true;
      emit(CreateManagementState());
      DioHelper.postData(
        url: "/api/management/create_management",
        data: {
          'management_id': managementIdController.text,
          'name': managementNameController.text,
          'email': managementEmailController.text,
          'password': managementPasswordController.text,
          "birth_day": managementBirthDayController.text,
          "phone": managementPhoneController.text,
          "mobile": managementMobileController.text,
          "NAT_id": managementNATIDController.text,
          "address": managementAddressController.text,
          "department": managementDepartmentController.text,
          "user_type": userType,
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
        if (value.data["message"] == "Management added successfully") {
          if (userType == "admin") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewAdminsScreen()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewDoctorsScreen()));
          }
        }

        if(value.data["message"] == "Error"){
          isLoading = false;
        }

        emit(CreateManagementSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateManagementErrorState());
      });
    } catch (e) {}
  }

  void changeLevel(String selectDepartment) async {
    managementDepartmentController.text = selectDepartment.toString();

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
