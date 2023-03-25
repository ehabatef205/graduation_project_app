import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/home_student/cubit/states.dart';

class HomeStudentCubit extends Cubit<HomeStudentStates> {
  HomeStudentCubit() : super(HomeStudentInitialState());

  static HomeStudentCubit get(context) => BlocProvider.of(context);
}