import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/change_password_doctor/change_password_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/view_profile_doctor/view_profile_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/settings_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/settings_doctor/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_students/view_student.dart';
import 'package:graduation_project_app/modules/logIn/logIn_screen.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDoctorScreen extends StatelessWidget {
  const SettingsDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsDoctorCubit(),
      child: BlocConsumer<SettingsDoctorCubit, SettingsDoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SettingsDoctorCubit cubit = SettingsDoctorCubit.get(context);
          if (!cubit.isDone) {
            SettingsDoctorCubit.get(context).readDark(context);
          }
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      "View Profile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ViewProfileDoctorScreen()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Dark Mode",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    trailing:
                        Consumer<ThemeNotifier>(builder: (context, theme, _) {
                      return CupertinoSwitch(
                        value: cubit.isDark,
                        onChanged: (value) {
                          cubit.changeMode(theme, context);
                        },
                      );
                    }),
                    leading: Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.password,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'Change password',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordDoctorScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'Contact us',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      cubit.send();
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();

                      await sharedPreferences.remove("user_type");
                      await sharedPreferences.remove("password");

                      await sharedPreferences
                          .remove("token")
                          .whenComplete(() async {
                        AppCubit.get(context).changeIndex(0);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
