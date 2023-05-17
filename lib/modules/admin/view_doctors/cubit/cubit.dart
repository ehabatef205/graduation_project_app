import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewDoctorsCubit extends Cubit<ViewDoctorsStates> {
  ViewDoctorsCubit() : super(ViewDoctorsInitialState());

  static ViewDoctorsCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  bool isLoading = true;

  ManagementsModel? managementsModel;

  String search = "";

  void onChanged(String newValue) {
    search = newValue;
    emit(ChangeStudentIdState());
  }

  void getDoctors() {
    try {
      isLoading = true;
      emit(StudentsLoadingState());
      DioHelper.getData(
        url: "/api/management/get_doctors",
      ).then((value) {
        managementsModel = ManagementsModel.fromJson(value.data);
        isLoading = false;
        emit(StudentsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(StudentsErrorState());
      });
    } catch (e) {}
  }
}
