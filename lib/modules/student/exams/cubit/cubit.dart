import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/states.dart';


class StudentExamsCubit extends Cubit<StudentExamsStates>{
  StudentExamsCubit() : super(StudentExamsInitialState());

  static StudentExamsCubit get(context) => BlocProvider.of(context);

}