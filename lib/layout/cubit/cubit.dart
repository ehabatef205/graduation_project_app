import 'package:bloc/bloc.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 2;

  List<Widget> screens = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Courses Screen")),
    const Center(child: Text("Chat Screen")),
    const Center(child: Text("Settings Screen")),
  ];

  List<FluidNavBarIcon> icons(int index) {
    return [
      FluidNavBarIcon(
        icon: Icons.person,
        backgroundColor: index == 0 ? Colors.black : Colors.white,
      ),
      FluidNavBarIcon(
        icon: Icons.chat_outlined,
        backgroundColor: index == 1 ? Colors.black : Colors.white,
      ),
      FluidNavBarIcon(
        icon: Icons.home_outlined,
        backgroundColor: index == 2 ? Colors.black : Colors.white,
      ),
      FluidNavBarIcon(
        icon: Icons.stream,
        backgroundColor: index == 3 ? Colors.black : Colors.white,
      ),
    ];
  }

  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    emit(ChangeIndexState());
  }
}
