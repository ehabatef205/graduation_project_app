import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/view_course/cubit/states.dart';

class ViewCourseCubit extends Cubit<ViewCourseStates>{
  ViewCourseCubit() : super(InitialViewCoursesState());
  static ViewCourseCubit get(context) => BlocProvider.of(context);

}