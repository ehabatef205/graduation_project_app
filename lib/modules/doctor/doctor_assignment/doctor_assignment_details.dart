import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/create_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class DoctorAssignmentDetailsScreen extends StatelessWidget {
  final Respone group;
  final int index;
  const DoctorAssignmentDetailsScreen({Key? key, required this.group, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorAssignmentCubit(),
      child: BlocConsumer<DoctorAssignmentCubit, DoctorAssignmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorAssignmentCubit cubit = DoctorAssignmentCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Assignment ${index + 1}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: group.assignments![index].length,
                    itemBuilder: (context, index2) {
                      return ListTile(
                        title: Text(
                          group.assignments![index][index2]["student_id"],
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .color,
                          ),
                        ),
                        trailing: Text(
                          group.assignments![index][index2]["grad"],
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .color,
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
