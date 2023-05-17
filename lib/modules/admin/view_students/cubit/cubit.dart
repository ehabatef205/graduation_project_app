import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/admin/view_students/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewStudentsCubit extends Cubit<ViewStudentsStates> {
  ViewStudentsCubit() : super(ViewStudentsInitialState());

  static ViewStudentsCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  bool isLoading = true;

  StudentsModel? studentsModel;

  String search = "";

  void onChanged(String newValue) {
    search = newValue;
    emit(ChangeStudentIdState());
  }

  void getStudents() {
    try {
      isLoading = true;
      emit(StudentsLoadingState());
      DioHelper.getData(
        url: "/api/management/get_students",
      ).then((value) {
        studentsModel = StudentsModel.fromJson(value.data);
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
