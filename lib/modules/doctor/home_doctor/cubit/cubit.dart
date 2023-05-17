import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/home_doctor/cubit/states.dart';

class HomeDoctorCubit extends Cubit<HomeDoctorStates> {
  HomeDoctorCubit() : super(InitialHomeDoctorState());

  static HomeDoctorCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> course = [
    {
      "course_id": "Comp 490",
      "image": "assets/logo.png",
    },
  ];

  int index = 0;

  var controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changeIndex(int newIndex){
    index = newIndex;
    emit(ChangeIndexDoctorState());
  }
}
