import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz.dart';
import 'package:graduation_project_app/modules/doctor/doctor_view_student/doctor_view_student_screen.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class DoctorExamsScreen extends StatelessWidget {
  final String course_id;

  const DoctorExamsScreen({Key? key, required this.course_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          DoctorExamsCubit()..getGroups(course_id: course_id),
      child: BlocConsumer<DoctorExamsCubit, DoctorExamsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorExamsCubit cubit = DoctorExamsCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppScreen(
                          userType: management!.userType!, indexOfScreen: 2)));
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Exams',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppScreen(
                                userType: management!.userType!,
                                indexOfScreen: 2)));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorViewStudentScreen(
                                    course_id: course_id)));
                      },
                      icon: Icon(
                        Icons.view_comfortable,
                        color: Theme.of(context).iconTheme.color,
                      ))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "Quizzes",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      onTap: () {
                        cubit.changeIndex(0);
                      },
                      trailing: Icon(
                        cubit.show[0]
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    cubit.show[0]
                        ? cubit.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorButton,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.groups!.respone!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorQuizScreen(
                                                  group: cubit
                                                      .groups!.respone![index]),
                                        ),
                                      );
                                    },
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Group ${cubit.groups!.respone![index].groupNumber}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                  );
                                })
                        : const SizedBox(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListTile(
                      title: Text(
                        "Assignments",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      onTap: () {
                        cubit.changeIndex(1);
                      },
                      trailing: Icon(
                        cubit.show[1]
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    cubit.show[1]
                        ? cubit.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorButton,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.groups!.respone!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorAssignmentScreen(
                                                  group: cubit
                                                      .groups!.respone![index]),
                                        ),
                                      );
                                    },
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Group ${cubit.groups!.respone![index].groupNumber}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                  );
                                })
                        : const SizedBox(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListTile(
                      title: Text(
                        "Midterms",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      onTap: () {
                        cubit.changeIndex(2);
                      },
                      trailing: Icon(
                        cubit.show[2]
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    cubit.show[2]
                        ? cubit.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorButton,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.groups!.respone!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorMidTermScreen(
                                                  group: cubit
                                                      .groups!.respone![index]),
                                        ),
                                      );
                                    },
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Group ${cubit.groups!.respone![index].groupNumber}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                  );
                                })
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
