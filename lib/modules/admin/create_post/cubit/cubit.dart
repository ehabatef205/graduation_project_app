import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_post/cubit/states.dart';

class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit() : super(CreatePostInitialState());

  static CreatePostCubit get(context) => BlocProvider.of(context);
  TextEditingController postIdController = TextEditingController();
  TextEditingController postNameController = TextEditingController();
}