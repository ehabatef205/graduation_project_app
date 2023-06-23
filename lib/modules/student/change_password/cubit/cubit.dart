import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/student/change_password/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController changePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  void updatePassword({required BuildContext context, required String studentId}) async {
    try {
      loading = true;
      emit(ChangePasswordLoadingState());
      DioHelper.postData(
        url: "/api/students/update_password",
        data: {
          'student_id': studentId,
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
        emit(ChangePasswordSuccessState());
      }).catchError((error) {
        print(error.toString());
        loading = false;
        emit(ChangePasswordErrorState());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
