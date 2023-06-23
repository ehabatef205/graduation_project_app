import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/student/exams/student_exams.dart';
import 'package:graduation_project_app/modules/student/student_grades/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/student_grades/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';

class StudentGradesScreen extends StatelessWidget {
  const StudentGradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StudentGradesCubit(),
      child: BlocConsumer<StudentGradesCubit, StudentGradesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            StudentGradesCubit cubit = StudentGradesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: const SizedBox(),
                elevation: 0,
                title: Text(
                  "Courses Grades",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      cubit.changeView();
                    },
                    icon: Icon(
                      Icons.auto_graph_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              body: cubit.isView
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: student!.register!.length,
                        itemBuilder: (context, index) {
                          Register register =
                              Register.fromJson(student!.register![index]);
                          return !register.registrationCurrent!
                              ? Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ListTile(
                                    title: Text(
                                      register.courseId!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ),
                                    trailing: Text(
                                      register.finalGrad!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ),
                                    leading: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  register.image!))),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: student!.register!.length,
                        itemBuilder: (context, index) {
                          Register register =
                              Register.fromJson(student!.register![index]);
                          return register.registrationCurrent!
                              ? Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color!
                                              .withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StudentExamsScreen(
                                                    register: register),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      register.image!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          )),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            register.courseId!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
            );
          }),
    );
  }
}

/*
Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentExamsScreen(register: register),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        const BorderRadius.only(
                                            topLeft:
                                            Radius.circular(10),
                                            topRight:
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              register.image!,
                                            ),
                                            fit: BoxFit.cover)),
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                register.courseId!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      )
 */
