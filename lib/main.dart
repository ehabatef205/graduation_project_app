import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/MyBlocObserver.dart';
import 'package:graduation_project_app/modules/home_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/splash/splash_sceen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeStudentCubit(),
          ),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
    ),
    );
  }
}