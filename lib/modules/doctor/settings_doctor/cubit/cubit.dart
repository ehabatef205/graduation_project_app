import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/settings_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';

class SettingsDoctorCubit extends Cubit<SettingsDoctorStates> {
  SettingsDoctorCubit() : super(InitialSettingsDoctorState());

  static SettingsDoctorCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  bool isDone = false;

  void readDark(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);
    themeProvider.readData().then((value) {
      isDark = value;
      isDone = true;
      emit(ChangeModeState());
    });
  }

  void changeMode(ThemeNotifier theme, BuildContext context){
    theme.readData().then((value) {
        if (value) {
          theme.setLightMode();
        } else {
          theme.setDarkMode();
        }
        isDone = false;
        emit(ChangeModeState());
    });
  }
}
