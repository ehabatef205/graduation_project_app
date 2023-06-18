import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/cubit/states.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';

class SettingsAdminCubit extends Cubit<SettingsAdminStates> {
  SettingsAdminCubit() : super(InitialSettingsAdminState());

  static SettingsAdminCubit get(context) => BlocProvider.of(context);

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

  Future<void> send() async {
    final Email email = Email(
      body: "",
      subject: "",
      recipients: ["ehabmahmoud205@gmail.com"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }
  }
}
