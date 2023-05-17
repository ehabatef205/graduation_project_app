import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/grades/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class AdminGradesCubit extends Cubit<AdminGradesStates>{
  AdminGradesCubit() : super(AdminGradesInitialState());

  static AdminGradesCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;
  DepartmentModel? departments;

  Future<void> getDepartments() async {
    try {
      isLoading = true;
      emit(DepartmentLoadingState());
      DioHelper.getData(
        url: "/api/department/view_all_departments",
      ).then((value) {
        departments = DepartmentModel.fromJson(value.data);
        isLoading = false;
        emit(DepartmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(DepartmentErrorState());
      });
    } catch (e) {}
  }
}