import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class DoctorExamsCubit extends Cubit<DoctorExamsStates> {
  DoctorExamsCubit() : super(DoctorExamsInitialState());

  static DoctorExamsCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List<bool> show = [false, false, false,];

  void changeIndex(int newIndex){
    for(int i = 0; i < show.length; i++){
      if(i != newIndex){
        show[i] = false;
      }
    }
    index = newIndex;
    show[index] = !show[index];
    emit(ChangeState());
  }

  bool isLoading = false;

  GroupsModel? groups;

  Future<void> getGroups({required String course_id}) async {
    try {
      isLoading = true;
      emit(GroupsLoadingState());
      DioHelper.postData(
        url: "/api/groups/view_group_by_id",
        data: {
          "course_id": course_id,
        }
      ).then((value) async {
        groups = GroupsModel.fromJson(value.data);
        isLoading = false;
        emit(GroupsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(GroupsErrorState());
      });
    } catch (e) {}
  }
}