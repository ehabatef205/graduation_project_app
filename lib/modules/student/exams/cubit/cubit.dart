import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/states.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';


class StudentExamsCubit extends Cubit<StudentExamsStates>{
  StudentExamsCubit() : super(StudentExamsInitialState());

  static StudentExamsCubit get(context) => BlocProvider.of(context);

  int index = 0;

  List<bool> show = [false, false, false, false];

  bool isLoading = false;

  Respone? group;

  void changeIndex(int newIndex){
    for(int i = 0; i < show.length; i++){
      if(i != newIndex){
        show[i] = false;
      }
    }
    index = newIndex;
    show[index] = !show[index];
    emit(ChangeState());
  }

  Future<void> getGroups({required Register register}) async {
    try {
      isLoading = true;
      emit(GroupLoadingState());
      DioHelper.postData(
          url: "/api/groups/view_group_by_course_id_and_group_number",
          data: {
            "course_id": register.courseId,
            "group_number": register.groupNumber,
          }
      ).then((value) async {
        group = Respone.fromJson(value.data["respone"]);
        isLoading = false;
        emit(GroupSuccessState());
      }).catchError((error) {
        print(error.toString());
        isLoading = false;
        emit(GroupErrorState());
      });
    } catch (e) {}
  }
}