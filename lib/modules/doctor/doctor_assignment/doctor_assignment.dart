import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment_details.dart';

class DoctorAssignmentScreen extends StatelessWidget {
  const DoctorAssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
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
                  "Assignment",
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
                          "Assignment ${counter++}",
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
                              builder: (context) => DoctorAssignmentDetailsScreen(),
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
