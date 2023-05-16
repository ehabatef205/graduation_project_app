import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/states.dart';


class DoctorMidTermCubit extends Cubit<DoctorMidTermStates>{
  DoctorMidTermCubit() : super(DoctorMidTermInitialState());

  static DoctorMidTermCubit get(context) => BlocProvider.of(context);
}