import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';


class DoctorMidTermCubit extends Cubit<DoctorMidTermStates>{
  DoctorMidTermCubit() : super(DoctorMidTermInitialState());

  static DoctorMidTermCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  Respone? groupData;

  Future<void> getGroupData({required Respone group}) async{
    try {
      isLoading = true;
      emit(GroupDataState());
      DioHelper.postData(
        url: "/api/groups/view_group_by_course_id_and_group_number",
        data: {
          'course_id': group.courseId,
          'group_number': group.groupNumber,
        },
      ).then((value) {
        groupData = Respone.fromJson(value.data["respone"]);
        isLoading = false;
        emit(GroupDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(GroupDataErrorState());
      });
    } catch (e) {}
  }
}