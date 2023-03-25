import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/get_id/cubit/states.dart';

class GetIdCubit extends Cubit<GetIdStates> {
  GetIdCubit() : super(GetIdInitialState());

  static GetIdCubit get(context) => BlocProvider.of(context);

  TextEditingController nationalIdController = TextEditingController();
  TextEditingController highSchoolDegreeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
