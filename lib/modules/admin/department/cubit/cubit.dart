import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/department/cubit/states.dart';

class DepartmentCubit extends Cubit<DepartmentStates> {
  DepartmentCubit() : super(InitialDepartmentState());

  static DepartmentCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> department = [
    {
      "department_id": "Computer science",
      "image": "assets/logo.png",
    },
    {
      "department_id": "Plant",
      "image": "assets/logo.png",
    },
    {
      "department_id": "Math",
      "image": "assets/logo.png",
    },
    {
      "department_id": "Zoology",
      "image": "assets/logo.png",
    },
  ];
}
