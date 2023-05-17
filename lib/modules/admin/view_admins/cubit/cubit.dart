import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/view_admins/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class ViewAdminsCubit extends Cubit<ViewAdminsStates> {
  ViewAdminsCubit() : super(ViewAdminsInitialState());

  static ViewAdminsCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  bool isLoading = true;

  ManagementsModel? managementsModel;

  String search = "";

  void onChanged(String newValue) {
    search = newValue;
    emit(ChangeStudentIdState());
  }

  void getAdims() {
    try {
      isLoading = true;
      emit(StudentsLoadingState());
      DioHelper.getData(
        url: "/api/management/get_Admins",
      ).then((value) {
        print(value);
        managementsModel = ManagementsModel.fromJson(value.data);
        isLoading = false;
        emit(StudentsSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = true;
        emit(StudentsErrorState());
      });
    } catch (e) {}
  }
}
