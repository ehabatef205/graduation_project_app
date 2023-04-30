import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/settings_admin/cubit/states.dart';
import 'package:graduation_project_app/modules/student/view_profile/view_profile_screen.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';

class SettingsAdminScreen extends StatelessWidget {
  const SettingsAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => SettingsAdminCubit(),
      child: BlocConsumer<SettingsAdminCubit, SettingsAdminStates>(
        listener: (context, state){},
        builder: (context, state){
          SettingsAdminCubit cubit = SettingsAdminCubit.get(context);
          if(!cubit.isDone){
            SettingsAdminCubit.get(context).readDark(context);
          }
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).textTheme.bodyText1!.color,
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
                              builder: (context) => const ViewProfileScreen()));
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Dark Mode",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    trailing: Consumer<ThemeNotifier>(builder: (context, theme, _) {
                      return CupertinoSwitch(
                        value: cubit.isDark,
                        onChanged: (value) {
                          cubit.changeMode(theme, context);
                        },
                      );
                    }),
                    leading: const Icon(
                      Icons.dark_mode,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: (){
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    title: Text(
                      'Connect us',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: (){
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
