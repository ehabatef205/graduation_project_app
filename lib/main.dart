import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/MyBlocObserver.dart';
import 'package:graduation_project_app/modules/admin/home_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/splash/splash_screen.dart';
import 'package:graduation_project_app/modules/student/home_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/view_table/cubit/cubit.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:graduation_project_app/shared/network/dio_helper.dart';
import 'package:graduation_project_app/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  token = sharedPreferences.getString("token");
  userType = sharedPreferences.getString("user_type");
  password = sharedPreferences.getString("password");
  print(password);

  print("Hello $token");
  print("Hello $userType");

  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getData(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeAdminCubit()..postOfAdmin(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeStudentCubit()..postOfAdmin(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Consumer<ThemeNotifier>(
              builder: (context, ThemeNotifier theme, _) => MaterialApp(
                title: 'Education System',
                theme: theme.getTheme(),
                debugShowCheckedModeBanner: false,
                home: const SplashScreen(),
              ),
            );
          }),
    );
  }
}
