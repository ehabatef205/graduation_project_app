import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz.dart';

class DoctorExamsScreen extends StatelessWidget {
  const DoctorExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorExamsCubit(),
      child: BlocConsumer<DoctorExamsCubit, DoctorExamsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorExamsCubit cubit = DoctorExamsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Exams',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Quiz",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorQuizScreen(),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.grade_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: Text(
                      "Assignment",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorAssignmentScreen(),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.grade_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListTile(
                    title: Text(
                      "Midterm",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorMidTermScreen(),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.grade_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
