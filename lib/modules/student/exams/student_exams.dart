import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/student_midterm.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/exams/cubit/states.dart';
import 'package:graduation_project_app/modules/student/student_assignment/student_assignment.dart';
import 'package:graduation_project_app/modules/student/student_quiz/student_quiz.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class StudentExamsScreen extends StatelessWidget {
  final Register register;

  const StudentExamsScreen({Key? key, required this.register})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          StudentExamsCubit()..getGroups(register: register),
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
                                itemCount: cubit.group!.quizzes!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Quiz ${index + 1}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                    trailing: SizedBox(
                                      width: 20,
                                      child: ListView.builder(
                                          itemCount: cubit
                                              .group!.quizzes![index].length,
                                          itemBuilder: (context, index2) {
                                            return cubit.group!.quizzes![index]
                                                            [index2]
                                                        ["student_id"] ==
                                                    student!.studentId
                                                ? Text(
                                                    cubit.group!.quizzes![index]
                                                        [index2]["grad"],
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .color),
                                                  )
                                                : SizedBox();
                                          }),
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
                                itemCount: cubit.group!.assignments!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Assignment ${index + 1}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                    trailing: SizedBox(
                                      width: 20,
                                      child: ListView.builder(
                                          itemCount: cubit.group!
                                              .assignments![index].length,
                                          itemBuilder: (context, index2) {
                                            return cubit.group!.assignments![
                                                            index][index2]
                                                        ["student_id"] ==
                                                    student!.studentId
                                                ? Text(
                                                    cubit.group!
                                                            .assignments![index]
                                                        [index2]["grad"],
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .color),
                                                  )
                                                : SizedBox();
                                          }),
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
                                itemCount: cubit.group!.midterms!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const SizedBox(),
                                    title: Text(
                                      "Midterm ${index + 1}",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                    trailing: SizedBox(
                                      width: 20,
                                      child: ListView.builder(
                                          itemCount: cubit
                                              .group!.midterms![index].length,
                                          itemBuilder: (context, index2) {
                                            return cubit.group!.midterms![index]
                                                            [index2]
                                                        ["student_id"] ==
                                                    student!.studentId
                                                ? Text(
                                                    cubit.group!
                                                            .midterms![index]
                                                        [index2]["grad"],
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .color),
                                                  )
                                                : SizedBox();
                                          }),
                                    ),
                                  );
                                })
                        : const SizedBox(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    register.finalGrad != "0"
                        ? ListTile(
                            title: Text(
                              "Final",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            onTap: () {
                              cubit.changeIndex(3);
                            },
                            trailing: Icon(
                              cubit.show[3]
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )
                        : const SizedBox(),
                    cubit.show[3]
                        ? cubit.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorButton,
                                ),
                              )
                            : ListTile(
                                leading: const SizedBox(),
                                title: Text(
                                  "Final",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                ),
                                trailing: Text(
                                  register.finalGrad!,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                                ))
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
