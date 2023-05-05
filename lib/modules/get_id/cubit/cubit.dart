import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/get_id/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';

class GetIdCubit extends Cubit<GetIdStates> {
  GetIdCubit() : super(GetIdInitialState());

  static GetIdCubit get(context) => BlocProvider.of(context);

  TextEditingController nationalIdController = TextEditingController();
  TextEditingController highSchoolDegreeController = TextEditingController();
  TextEditingController changePassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  bool isPressed = false;
  String id = "";
  bool loading = false;

  void onPressed(){
    isPressed = !isPressed;
    emit(ChangePressedState());
  }

  void getId() {
    try{
      loading = true;
      emit(GetIdLoadingState());
      DioHelper.postData(
        url: "/api/students/get_student_by_national_and_high",
        data: {
          'NAT_id': nationalIdController.text,
          'HS_score': highSchoolDegreeController.text,
        },
      ).then((value) {
        id = value.data["data"]["student_id"];
        loading = false;
        isPressed = true;
        emit(GetIdSuccessState());
      }).catchError((error) {
        print(error.toString());
        loading = false;
        emit(GetIdErrorState());
      });
    }catch(e){
      print(e.toString());
    }
  }

  void updatePassword(){
    try{
      loading = true;
      emit(GetIdLoadingState());
      DioHelper.postData(
        url: "/api/students/update_password",
        data: {
          'student_id': id,
          'password': changePassword.text,
        },
      ).then((value) {
        Fluttertoast.showToast(
          msg: value.data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white,
          fontSize: 16,
        );
        loading = false;
        emit(GetIdSuccessState());
      }).catchError((error) {
        print(error.toString());
        loading = false;
        emit(GetIdErrorState());
      });
    }catch(e){
      print(e.toString());
    }
  }
}
