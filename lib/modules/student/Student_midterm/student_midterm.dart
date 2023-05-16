import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/midterm_details.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/cubit/states.dart';
import 'package:graduation_project_app/modules/student/exams/student_exams.dart';

class StudentMidTermScreen extends StatelessWidget {
  const StudentMidTermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return BlocProvider(
      create: (BuildContext context) => StudentMidTermCubit(),
      child: BlocConsumer<StudentMidTermCubit, StudentMidTermStates>(
          listener: (context, state) {},
          builder: (context, state) {
            StudentMidTermCubit cubit = StudentMidTermCubit.get(context);
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
                    itemCount: 2,
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
                              builder: (context) => MidTermDetailsScreen(),
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
