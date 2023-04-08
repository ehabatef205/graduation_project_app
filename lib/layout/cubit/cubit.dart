import 'package:bloc/bloc.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/modules/home_student/home_student_screen.dart';
import 'package:graduation_project_app/modules/setings/settings_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  List<Widget> screens = [
    const HomeStudentScreen(),
    const Center(child: Text("Courses Screen")),
    const Center(child: Text("Chat Screen")),
    const SettingsScreen(),
  ];

  List<FluidNavBarIcon> icons(int index) {
    return [
      FluidNavBarIcon(
        icon: Icons.home_outlined,
      ),
      FluidNavBarIcon(
        icon: Icons.date_range_sharp,
      ),
      FluidNavBarIcon(
        icon: Icons.data_exploration,
      ),
      FluidNavBarIcon(
        icon: Icons.settings,
      ),
    ];
  }

  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    emit(ChangeIndexState());
  }
}
