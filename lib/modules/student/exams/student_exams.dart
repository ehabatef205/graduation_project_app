import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/student_midterm.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/states.dart';
import 'package:graduation_project_app/modules/student/student_assignment/student_assignment.dart';
import 'package:graduation_project_app/modules/student/student_quiz/student_quiz.dart';

class StudentExamsScreen extends StatelessWidget {
  const StudentExamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StudentExamsCubit(),
      child: BlocConsumer<StudentExamsCubit, StudentExamsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            StudentExamsCubit cubit = StudentExamsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Exams",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
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
                            builder: (context) => StudentQuizScreen(),
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
                            builder: (context) => StudentAssignmentScreen(),
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
                            builder: (context) => StudentMidTermScreen(),
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
          }),
    );
  }
}
