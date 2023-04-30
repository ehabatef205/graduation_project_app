import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/view_table/cubit/states.dart';

class ViewTableCubit extends Cubit<ViewTableStates> {
  ViewTableCubit() : super(ViewTableInitialState());

  static ViewTableCubit get(context) => BlocProvider.of(context);

  List<String> days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  List<String> time = ["8 am","10 am","12 pm","2 pm","4 pm","6 pm","8 pm",];
}