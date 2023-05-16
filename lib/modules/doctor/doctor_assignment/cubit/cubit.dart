import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/states.dart';


class DoctorAssignmentCubit extends Cubit<DoctorAssignmentStates>{
  DoctorAssignmentCubit() : super(DoctorAssignmentInitialState());

  static DoctorAssignmentCubit get(context) => BlocProvider.of(context);
}