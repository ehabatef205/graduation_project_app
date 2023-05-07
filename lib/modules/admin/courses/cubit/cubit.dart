import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/modules/admin/courses/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(InitialCoursesState());

  static CoursesCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  CourseModel? courses;

  Future<void> getCourses({required String department}) async {
    try {
      isLoading = true;
      emit(CourseLoadingState());
      DioHelper.postData(
        url: "/api/course/view_course_by_department",
        data: {
          "department": department
        }
      ).then((value) {
        courses = CourseModel.fromJson(value.data);
        isLoading = false;
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(CourseErrorState());
      });
    } catch (e) {}
  }
}
