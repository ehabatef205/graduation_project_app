import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/models/login_management_model.dart';
import 'package:graduation_project_app/models/login_student_model.dart';
import 'package:graduation_project_app/modules/logIn/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void passwordChange() {
    isPassword = !isPassword;
    emit(ChangeState());
  }

  void userLogin({required BuildContext context}) {
    try {
      isLoading = true;
      emit(LoginLoadingState());
      DioHelper.postData(
        url: "/api/login",
        data: {
          'id': idController.text,
          'password': passwordController.text,
        },
      ).then((value) {
        if (value.data["message"] == "Id or password is invalid") {
          Fluttertoast.showToast(
            msg: value.data["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
            fontSize: 16,
          );
          isLoading = false;
          emit(LoginErrorState());
        } else {
          if (value.data["user_type"] == "student") {
            loginStudentModel = LoginStudentModel.fromJson(value.data);
            student = Student.fromJson(value.data["data"]);
            token = loginStudentModel!.token;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AppScreen(userType: loginStudentModel!.userType!)));
          } else {
            loginManagementModel = LoginManagementModel.fromJson(value.data);
            management = Management.fromJson(value.data["data"]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AppScreen(userType: management!.userType!)));
          }
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(LoginErrorState());
      });
    } catch (e) {}
  }
}
