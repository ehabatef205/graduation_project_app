import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/change_password_admin/change_password_admin_screen.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/view_admins/view_admins.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/view_doctors.dart';
import 'package:graduation_project_app/modules/admin/view_students/view_student.dart';
import 'package:graduation_project_app/modules/logIn/logIn_screen.dart';
import 'package:graduation_project_app/modules/admin/view_profile_admin/view_profile_admin_screen.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsAdminScreen extends StatelessWidget {
  const SettingsAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsAdminCubit(),
      child: BlocConsumer<SettingsAdminCubit, SettingsAdminStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SettingsAdminCubit cubit = SettingsAdminCubit.get(context);
          if (!cubit.isDone) {
            SettingsAdminCubit.get(context).readDark(context);
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
                                  const ViewProfileAdminScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_box_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      "View Student",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewStudentsScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.admin_panel_settings_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      "View Admins",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAdminsScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.book_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(
                      "View Doctors",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewDoctorsScreen()));
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
                              builder: (context) =>
                                  ChangePasswordAdminScreen()));
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
