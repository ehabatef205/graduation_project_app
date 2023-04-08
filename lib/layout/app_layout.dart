import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            body: cubit.screens[cubit.bottomNavIndex], //destination screen
            bottomNavigationBar: FluidNavBar(
              style: FluidNavBarStyle(
                barBackgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                iconSelectedForegroundColor: Colors.grey,
                iconUnselectedForegroundColor: Colors.grey,
                iconBackgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
              animationFactor: 1,
              defaultIndex: 0,
              icons: cubit.icons(cubit.bottomNavIndex),
              onChange: (index) => cubit.changeIndex(index),
            ));
      },
    );
  }
}
