import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/modules/doctor/home_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

import '../../../../models/groups_model.dart';

class HomeDoctorCubit extends Cubit<HomeDoctorStates> {
  HomeDoctorCubit() : super(InitialHomeDoctorState());

  static HomeDoctorCubit get(context) => BlocProvider.of(context);

  List<Course> courses = [];

  List<String> coursesID = [];

  bool isLoading = false;

  List<Respone> groups = [];

  Future<void> getGroups() async {
    try {
      isLoading = true;
      emit(GroupsLoadingState());
      DioHelper.getData(
        url: "/api/groups/view_all_groups",
      ).then((value) async {
        for (int i = 0; i < value.data["respone"].length; i++) {
          Respone group = Respone.fromJson(value.data["respone"][i]);
          if (group.teacher!.teacherId == management!.managementId) {
            if(!coursesID.contains(group.courseId)){
              groups.add(group);
              coursesID.add(group.courseId!);
            }
            print(groups[i].teacher!.teacherId);
          }

          if (group.session!.teacherIdSession == management!.managementId) {
            if(!coursesID.contains(group.courseId)){
              groups.add(group);
              coursesID.add(group.courseId!);
            }
            print(groups[i].session!.teacherIdSession);
          }
        }
        emit(GroupsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(GroupsErrorState());
      }).whenComplete(() async {
        await getCourseOfGroup(groups).whenComplete(() {
          isLoading = false;
          emit(DoneState());
        });
      });
    } catch (e) {}
  }

  Future<void> getCourseOfGroup(List<Respone> groups2) async{
    for (int i = 0; i < groups2.length; i++) {
      DioHelper.postData(
        url: "/api/course/view_course_by_id",
        data: {
          'course_id': groups2[i].courseId,
        },
      ).then((value) async {
        courses.add(Course.fromJson(value.data["respone"]));
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(CourseErrorState());
      });
    }
  }
}
