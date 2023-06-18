import 'package:bloc/bloc.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/models/login_management_model.dart';
import 'package:graduation_project_app/models/login_student_model.dart';
import 'package:graduation_project_app/modules/admin/department/department_screen.dart';
import 'package:graduation_project_app/modules/admin/grades/admin_grades.dart';
import 'package:graduation_project_app/modules/admin/home_admin/home_admin_screen.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/settings_admin_screen.dart';
import 'package:graduation_project_app/modules/doctor/doctor_grades/doctor_grades.dart';
import 'package:graduation_project_app/modules/doctor/home_doctor/home_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/settings_doctor/settings_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/view_doctor_table/view_table_doctor_screen.dart';
import 'package:graduation_project_app/modules/student/home_student/home_student_screen.dart';
import 'package:graduation_project_app/modules/student/settings/settings_screen.dart';
import 'package:graduation_project_app/modules/student/student_grades/student_grades.dart';
import 'package:graduation_project_app/modules/student/view_table/view_table_screen.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  List<Widget> studentScreens = [
    const HomeStudentScreen(),
    const ViewTableScreen(),
    const StudentGradesScreen(),
    const SettingsScreen(),
  ];

  List<Widget> doctorScreens = [
    const HomeDoctorScreen(),
    const ViewDoctorTableScreen(),
    const DoctorGradesScreen(),
    const SettingsDoctorScreen(),
  ];

  List<Widget> adminScreens = [
    const HomeAdminScreen(),
    const DepartmentScreen(),
    const AdminGradesScreen(),
    const SettingsAdminScreen(),
  ];

  List<FluidNavBarIcon> icons(int index) {
    return [
      FluidNavBarIcon(
        icon: Icons.home_outlined,
      ),
      FluidNavBarIcon(
        icon: Icons.date_range_sharp,
      ),
      FluidNavBarIcon(
        icon: Icons.data_exploration,
      ),
      FluidNavBarIcon(
        icon: Icons.settings,
      ),
    ];
  }

  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    emit(ChangeIndexState());
  }

  Future<void> getData() async {
    emit(LoadingAccountState());

    print(token);
    DioHelper.getData(url: "/api/get_data_with_token", token: token)
        .then((value) async{
      if (value.data["user_type"] == "student") {
        loginStudentModel = LoginStudentModel.fromJson(value.data);
        student = Student.fromJson(value.data["data"]);
        token = loginStudentModel!.token;
      } else {
        loginManagementModel = LoginManagementModel.fromJson(value.data);
        management = Management.fromJson(value.data["data"]);
        token = loginManagementModel!.token;
      }
      emit(SuccessAccountState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAccountState());
    });

    emit(FinalAccountState());
  }
}
