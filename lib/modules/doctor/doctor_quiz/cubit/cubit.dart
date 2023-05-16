import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/states.dart';

class DoctorQuizCubit extends Cubit<DoctorQuizStates> {
  DoctorQuizCubit() : super(DoctorQuizInitialState());

  static DoctorQuizCubit get(context) => BlocProvider.of(context);
}