import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm_details.dart';

class DoctorMidTermScreen extends StatelessWidget {
  const DoctorMidTermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return BlocProvider(
      create: (BuildContext context) => DoctorMidTermCubit(),
      child: BlocConsumer<DoctorMidTermCubit, DoctorMidTermStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorMidTermCubit cubit = DoctorMidTermCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "MidTerm",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "MidTerm ${counter++}",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        trailing: Text(
                          "10 / 10",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorMidTermDetailsScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
