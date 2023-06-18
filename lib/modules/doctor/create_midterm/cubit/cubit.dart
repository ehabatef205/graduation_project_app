import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateMidTermCubit extends Cubit<CreateMidTermStates> {
  CreateMidTermCubit() : super(CreateMidTermInitialState());

  static CreateMidTermCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<String> midterms = [];

  void changeMidtermAllStudents(int students) {
    for (int i = 0; i < students; i++) {
      midterms.add("0");
      emit(ChangeMidtermAllStudentsState());
    }
  }

  void changeMidterm(int index, String grad) {
    midterms[index] = grad;
    emit(ChangeMidtermState());
  }

  Future<void> addMidterm({required Respone group}) async {
    try {
      print(midterms);
      isLoading = true;
      emit(CreateMidtermState());
      DioHelper.postData(
        url: "/api/groups/add_midterms",
        data: {
          'course_id': group.courseId,
          'group_number': group.groupNumber,
          'midterms': midterms
        },
      ).then((value) {
        emit(CreateMidtermSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateMidtermErrorState());
      });
    } catch (e) {}
  }
}