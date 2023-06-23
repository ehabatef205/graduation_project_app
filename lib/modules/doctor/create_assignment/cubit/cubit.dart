import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateAssignmentCubit extends Cubit<CreateAssignmentStates> {
  CreateAssignmentCubit() : super(CreateAssignmentInitialState());

  static CreateAssignmentCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<dynamic> assignments = [];

  void changeAssignmentAllStudents(List<dynamic> students) {
    for (int i = 0; i < students.length; i++) {
      assignments.add({
        "student_id": students[i],
        "grad": "0"
      });
      emit(ChangeAssignmentAllStudentsState());
    }
  }

  void changeAssignment(int index, String grad) {
    assignments[index] = {
      "student_id": assignments[index]["student_id"],
      "grad": grad
    };
    emit(ChangeAssignmentState());
  }

  Future<void> addAssignment({required Respone group, required BuildContext context}) async {
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DoctorAssignmentScreen(group: group)));
        emit(CreateAssignmentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CreateAssignmentErrorState());
      });
    } catch (e) {}
  }
}
