import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation_project_app/modules/admin/view_student/cubit/states.dart';

class ViewStudentCubit extends Cubit<ViewStudentStates> {
  ViewStudentCubit() : super(ViewStudentInitialState());

  static ViewStudentCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
}