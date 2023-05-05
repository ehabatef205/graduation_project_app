import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/post_model.dart';
import 'package:graduation_project_app/modules/student/view_comments/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewCommentsCubit extends Cubit<ViewCommentsStates> {
  ViewCommentsCubit() : super(InitialViewCommentsState());

  static ViewCommentsCubit get(context) => BlocProvider.of(context);

  TextEditingController commentController = TextEditingController();
  bool isSend = false;
  Respone? respone;

  void updateRespone(Respone newRespone) {
    respone = newRespone;
    emit(UpdateResponeState());
  }

  Future<void> sendComment() async {
    try {
      isSend = true;
      emit(SendCommentState());
      DioHelper.postData(
        url: "/api/posts/create_comment",
        data: {
          "id": respone!.sId,
          'user_id': loginStudentModel!.data!.studentId,
          'text': commentController.text,
          "name": loginStudentModel!.data!.name,
          "image": loginStudentModel!.data!.image,
        },
      ).then((value) {
        respone!.comments!.add(Comments(
            id: loginStudentModel!.data!.studentId,
            name: loginStudentModel!.data!.name,
            image: loginStudentModel!.data!.image,
            text: commentController.text, date: value.data["date"]));
        isSend = false;
        commentController.clear();
        emit(SendCommentSuccessState());
      }).catchError((error) {
        print(error.toString());
        isSend = false;
        emit(SendCommentErrorState());
      });
    } catch (e) {}
  }
}
