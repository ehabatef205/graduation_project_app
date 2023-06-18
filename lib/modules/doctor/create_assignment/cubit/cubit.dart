import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateAssignmentCubit extends Cubit<CreateAssignmentStates> {
  CreateAssignmentCubit() : super(CreateAssignmentInitialState());

  static CreateAssignmentCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<String> assignments = [];

  void changeAssignmentAllStudents(int students) {
    for (int i = 0; i < students; i++) {
      assignments.add("0");
      emit(ChangeAssignmentAllStudentsState());
    }
  }

  void changeAssignment(int index, String grad) {
    assignments[index] = grad;
    emit(ChangeAssignmentState());
  }

  Future<void> addAssignment({required Respone group}) async {
    try {
      print(assignments);
      isLoading = true;
      emit(CreateAssignmentState());
      DioHelper.postData(
        url: "/api/groups/add_assignments",
        data: {
          'course_id': group.courseId,
          'group_number': group.groupNumber,
          'assignments': assignments
        },
      ).then((value) {
        emit(CreateAssignmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateAssignmentErrorState());
      });
    } catch (e) {}
  }
}