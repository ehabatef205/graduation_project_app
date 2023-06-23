import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/doctor/change_password_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordDoctorCubit extends Cubit<ChangePasswordDoctorStates> {
  ChangePasswordDoctorCubit() : super(ChangePasswordDoctorInitialState());

  static ChangePasswordDoctorCubit get(context) => BlocProvider.of(context);

  TextEditingController changePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  void updatePassword({required BuildContext context}) async {
    try {
      loading = true;
      emit(ChangePasswordDoctorLoadingState());
      DioHelper.postData(
        url: "/api/management/update_password",
        data: {
          'management_id': management!.managementId,
          'password': changePassword.text,
        },
      ).then((value) async {
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        if (value.data["message"] == "Password updated successfully") {
          student!.password = changePassword.text;
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          await sharedPreferences.setString("password", changePassword.text);
          Navigator.pop(context);
        }
        loading = false;
        emit(ChangePasswordDoctorSuccessState());
      }).catchError((error) {
        print(error.toString());
        loading = false;
        emit(ChangePasswordDoctorErrorState());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
