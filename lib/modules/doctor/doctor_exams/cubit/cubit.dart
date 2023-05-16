import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/states.dart';

class DoctorExamsCubit extends Cubit<DoctorExamsStates> {
  DoctorExamsCubit() : super(DoctorExamsInitialState());

  static DoctorExamsCubit get(context) => BlocProvider.of(context);
}