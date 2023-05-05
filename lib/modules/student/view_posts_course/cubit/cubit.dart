import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/post_model.dart';
import 'package:graduation_project_app/modules/student/view_posts_course/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewPostsCourseCubit extends Cubit<ViewPostsCourseStates> {
  ViewPostsCourseCubit() : super(InitialViewPostsCourseState());

  static ViewPostsCourseCubit get(context) => BlocProvider.of(context);
  bool isLoading = true;
  PostModel? postModel;

  Future<void> postOfCourse({required String courseId}) async {
    try {
      isLoading = true;
      emit(CoursePostLoadingState());
      DioHelper.postData(
        url: "/api/posts/view_post_by_department_student",
        data: {
          'department': loginStudentModel!.data!.department,
          'course_id': courseId,
        },
      ).then((value) {
        postModel = PostModel.fromJson(value.data);
        isLoading = false;
        emit(CoursePostSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(CoursePostErrorState());
      });
    } catch (e) {}
  }
}
