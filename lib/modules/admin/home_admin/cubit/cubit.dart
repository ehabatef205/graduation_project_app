import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/post_model.dart';
import 'package:graduation_project_app/modules/admin/home_admin/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class HomeAdminCubit extends Cubit<HomeAdminStates> {
  HomeAdminCubit() : super(InitialHomeAdminState());

  static HomeAdminCubit get(context) => BlocProvider.of(context);

  bool isLoading = true;
  PostModel? postModel;

  Future<void> postOfAdmin() async {
    try {
      isLoading = true;
      emit(AdminPostLoadingState());
      DioHelper.postData(
        url: "/api/posts/view_post_by_department",
        data: {
          'department': "admin",
          "course_id": "admin"
        },
      ).then((value) {
        postModel = PostModel.fromJson(value.data);
        isLoading = false;
        emit(AdminPostSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(AdminPostErrorState());
      });
    } catch (e) {}
  }

  Future<void> updateHidden({required int index}) async {
    try {
      emit(HiddenPostState());
      DioHelper.postData(
        url: "/api/posts/update_hidden_post",
        data: {
          'id': postModel!.respone![index].sId,
          "hidden": !postModel!.respone![index].hidden!
        },
      ).then((value) {
        postModel!.respone![index].hidden = !postModel!.respone![index].hidden!;
        emit(HiddenPostSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(HiddenPostErrorState());
      });
    } catch (e) {}
  }

  Future<void> deletePost({required int index}) async {
    try {
      emit(HiddenPostState());
      DioHelper.deleteData(
        url: "/api/posts/delete_post",
        data: {
          'id': postModel!.respone![index].sId,
        },
      ).then((value) {
        emit(HiddenPostSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(HiddenPostErrorState());
      });
    } catch (e) {}
  }
}
