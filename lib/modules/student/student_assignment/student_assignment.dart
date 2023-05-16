import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/exams/student_exams.dart';
import 'package:graduation_project_app/modules/student/student_assignment/assignment_details.dart';
import 'package:graduation_project_app/modules/student/student_assignment/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/student_assignment/cubit/states.dart';

class StudentAssignmentScreen extends StatelessWidget {
  const StudentAssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return BlocProvider(
      create: (BuildContext context) => StudentAssignmentCubit(),
      child: BlocConsumer<StudentAssignmentCubit, StudentAssignmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            StudentAssignmentCubit cubit = StudentAssignmentCubit.get(context);
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
                              builder: (context) => AssignmentDetailsScreen(),
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
