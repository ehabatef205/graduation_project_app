import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/admin/view_course/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewCourseCubit extends Cubit<ViewCourseStates> {
  ViewCourseCubit() : super(InitialViewCoursesState());

  static ViewCourseCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  GroupsModel? groups;

  Future<void> getGroups({required String courseId}) async {
    try {
      groups = null;
      isLoading = true;
      emit(CourseLoadingState());
      DioHelper.postData(
          url: "/api/groups/view_group_by_id",
          data: {"course_id": courseId}).then((value) {
        groups = GroupsModel.fromJson(value.data);
        isLoading = false;
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(CourseErrorState());
      });
    } catch (e) {}
  }

  Future<void> deleteGroups({required String id}) async {
    try {
      emit(CourseLoadingState());
      DioHelper.deleteData(
              url: "/api/groups/delete_group", data: {"id": id}, token: token)
          .then((value) {
        emit(CourseSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(CourseErrorState());
      });
    } catch (e) {}
  }
}
