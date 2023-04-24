import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_department/cubit/states.dart';


class CreateDepartmentCubit extends Cubit<CreateDepartmentStates> {
  CreateDepartmentCubit() : super(CreateDepartmentInitialState());

  static CreateDepartmentCubit get(context) => BlocProvider.of(context);
  TextEditingController departmentIdController = TextEditingController();
  TextEditingController departmentNameController = TextEditingController();
  TextEditingController departmentDesController = TextEditingController();
}