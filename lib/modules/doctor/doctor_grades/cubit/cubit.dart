import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_grades/cubit/states.dart';


class DoctorGradesCubit extends Cubit<DoctorGradesStates> {
  DoctorGradesCubit() : super(DoctorGradesInitialState());

  static DoctorGradesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
}