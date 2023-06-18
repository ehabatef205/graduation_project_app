import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/create_group/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_course/view_course.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CreateGroupCubit extends Cubit<CreateGroupStates> {
  CreateGroupCubit() : super(CreateGroupInitialState());

  static CreateGroupCubit get(context) => BlocProvider.of(context);
  TextEditingController groupNumberController = TextEditingController();
  TextEditingController studentNumberController = TextEditingController();
  TextEditingController doctorLectureController = TextEditingController();
  TextEditingController dayLectureController = TextEditingController();
  TextEditingController timeLectureController = TextEditingController();
  TextEditingController hallLectureController = TextEditingController();
  TextEditingController doctorSectionController = TextEditingController();
  TextEditingController daySectionController = TextEditingController();
  TextEditingController timeSectionController = TextEditingController();
  TextEditingController hallSectionController = TextEditingController();

  List<String> days = ["sat", "sun", "mon", "tue", "wed", "thu"];
  List<String> time = [
    "8 am",
    "10 am",
    "12 pm",
    "2 pm",
    "4 pm",
    "6 pm",
    "8 pm",
  ];

  ManagementsModel? managementsModel;

  List<String> doctors = [];

  bool isLoading = false;
  bool isLoading2 = false;

  void changeDayLecture(String selectDepartment) async {
    dayLectureController.text = selectDepartment.toString();

    emit(ChangeDayLectureState());
  }

  void changeTimeLecture(String selectDepartment) async {
    timeLectureController.text = selectDepartment.toString();

    emit(ChangeTimeLectureState());
  }

  void changeDaySection(String selectDepartment) async {
    daySectionController.text = selectDepartment.toString();

    emit(ChangeDaySectionState());
  }

  void changeTimeSection(String selectDepartment) async {
    timeSectionController.text = selectDepartment.toString();

    emit(ChangeTimeSectionState());
  }

  void changeDoctorLecture(String selectDepartment) async {
    doctorLectureController.text = selectDepartment.toString();

    emit(ChangeDoctorLectureState());
  }

  void changeDoctorSection(String selectDepartment) async {
    doctorSectionController.text = selectDepartment.toString();

    emit(ChangeDoctorSectionState());
  }

  Future<void> addGroup(
      {required BuildContext context, required Course course, required Respone department}) async {
    try {
      isLoading = true;
      emit(CreateGroupState());
      DioHelper.postData(
        url: "/api/groups/create_group",
        data: {
          'course_id': course.courseId,
          'group_number': groupNumberController.text,
          'number_of_student': studentNumberController.text,
          'teacher_id': doctorLectureController.text,
          "time": "${dayLectureController.text} ${timeLectureController.text}",
          "hall": hallLectureController.text,
          "teacher_id_session": doctorSectionController.text,
          "time_session":
              "${daySectionController.text} ${timeSectionController.text}",
          "hall_session": hallSectionController.text,
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
        if(value.data["message"] == "Group added successfully"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCourseScreen(course: course, department: department)));
        }else{
          isLoading = false;
        }

        emit(CreateGroupSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(CreateGroupErrorState());
      });
    } catch (e) {}
  }

  void getDoctors({required String department}) {
    try {
      isLoading2 = true;
      emit(DoctorsLoadingState());
      DioHelper.getData(
        url: "/api/management/get_doctors",
      ).then((value) {
        managementsModel = ManagementsModel.fromJson(value.data);
        for (int i = 0; i < managementsModel!.data!.length; i++) {
          if (managementsModel!.data![i].department == department) {
            doctors.add(managementsModel!.data![i].managementId!);
          }
        }
        isLoading2 = false;
        emit(DoctorsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading2 = true;
        emit(DoctorsErrorState());
      });
    } catch (e) {}
  }
}
