import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_management/cubit/states.dart';


class CreateManagementCubit extends Cubit<CreateManagementStates> {
  CreateManagementCubit() : super(CreateManagementInitialState());

  static CreateManagementCubit get(context) => BlocProvider.of(context);
  TextEditingController managementIdController = TextEditingController();
  TextEditingController managementNameController = TextEditingController();
  TextEditingController managementEmailController = TextEditingController();
  TextEditingController managementPasswordController = TextEditingController();
  TextEditingController managementBirthDayController = TextEditingController();
  TextEditingController managementPhoneController = TextEditingController();
  TextEditingController managementMobileController = TextEditingController();
  TextEditingController managementNATIDController = TextEditingController();
  TextEditingController managementAddressController = TextEditingController();
  TextEditingController managementDepartmentController = TextEditingController();

  bool isPassword = true;

  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangeState());
  }
}