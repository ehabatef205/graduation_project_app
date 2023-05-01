import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/view_doctor_table/cubit/states.dart';

class ViewDoctorTableCubit extends Cubit<ViewDoctorTableStates>{
  ViewDoctorTableCubit() : super(ViewDoctorTableInitialState());
  static ViewDoctorTableCubit get(context) => BlocProvider.of(context);

  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  List<String> time = ["8 am","10 am","12 pm","2 pm","4 pm","6 pm","8 pm",];
}