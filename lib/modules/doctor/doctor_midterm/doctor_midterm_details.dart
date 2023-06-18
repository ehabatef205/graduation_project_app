import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/create_midterm.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class DoctorMidTermDetailsScreen extends StatelessWidget {
  final Respone group;
  final int index;

  const DoctorMidTermDetailsScreen(
      {Key? key, required this.group, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "Midterm ${index + 1}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: group.midterms![index].length,
                    itemBuilder: (context, index2) {
                      return ListTile(
                        title: Text(
                          group.midterms![index][index2]["student_id"],
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        trailing: Text(
                          group.midterms![index][index2]["grad"],
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}
