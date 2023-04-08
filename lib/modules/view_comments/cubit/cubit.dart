import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/view_comments/cubit/states.dart';

class ViewCommentsCubit extends Cubit<ViewCommentsStates> {
  ViewCommentsCubit() : super(InitailViewCommentsState());

  static ViewCommentsCubit get(context) => BlocProvider.of(context);

  TextEditingController controller = TextEditingController();
}
