import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/student_midterm.dart';
import 'package:graduation_project_app/modules/student/register_course/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/register_course/cubit/states.dart';
import 'package:graduation_project_app/modules/student/student_assignment/student_assignment.dart';
import 'package:graduation_project_app/modules/student/student_quiz/student_quiz.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class RegisterCourseScreen extends StatelessWidget {
  const RegisterCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCourseCubit()..getCourses(),
      child: BlocConsumer<RegisterCourseCubit, RegisterCourseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCourseCubit cubit = RegisterCourseCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppScreen(
                          userType: student!.userType!, indexOfScreen: 1)));
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Register courses",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppScreen(
                                userType: student!.userType!,
                                indexOfScreen: 1)));
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      cubit.changeView();
                    },
                    icon: Icon(
                      cubit.isViewCourse
                          ? Icons.add_box_outlined
                          : Icons.view_comfortable,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              body: cubit.isViewCourse
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: student!.register!.length,
                          itemBuilder: (context, index) {
                            Register register =
                                Register.fromJson(student!.register![index]);
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    register.courseId!,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                      fontSize: 18,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      cubit.unregisterCourse(
                                          index: index,
                                          course_id: register.courseId!,
                                          group_number: register.groupNumber!,
                                          context: context);
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }),
                    )
                  : cubit.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colorButton,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color:
                                            Theme.of(context).iconTheme.color!)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        "Choose course",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                      ),
                                    ),
                                    value: cubit.courseSelect,
                                    dropdownColor:
                                        Theme.of(context).scaffoldBackgroundColor,
                                    iconEnabledColor:
                                        Theme.of(context).iconTheme.color,
                                    items: cubit.coursesId.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      cubit.changeCourse(newValue!);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: cubit.isViewGroups
                                            ? cubit.groupsNumber.isNotEmpty
                                                ? Theme.of(context)
                                                    .iconTheme
                                                    .color!
                                                : Colors.grey
                                            : Colors.grey)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: cubit.isViewGroups
                                          ? cubit.groupsNumber.isNotEmpty
                                              ? Text(
                                                  "Choose group",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                  ),
                                                )
                                              : Text(
                                                  "No groups in this course",
                                                  style: TextStyle(
                                                    color: cubit.groupsNumber
                                                            .isNotEmpty
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .color
                                                        : Colors.grey,
                                                  ),
                                                )
                                          : const SizedBox(),
                                    ),
                                    value: cubit.groupSelect,
                                    dropdownColor:
                                        Theme.of(context).scaffoldBackgroundColor,
                                    iconEnabledColor:
                                        Theme.of(context).iconTheme.color,
                                    items: cubit.groupsNumber.map((item) {
                                      return DropdownMenuItem(
                                        enabled: cubit.isViewGroups,
                                        value: item,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      cubit.changeGroup(newValue!);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              cubit.isLoading2
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: colorButton,
                                      ),
                                    )
                                  : Container(
                                      width: double.infinity,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (cubit.groupSelect != null &&
                                              cubit.courseSelect != null) {
                                            cubit.registerCourse(
                                                context: context);
                                          }
                                        },
                                        color: Colors.green[600],
                                        height: 50.0,
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: cubit.isViewGroups
                                    ? ListView.builder(
                                        itemCount: cubit.groups!.respone!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Group ${cubit.groups!.respone![index].groupNumber} :",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Doctor of lecture is ${cubit.groups!.respone![index].teacher!.teacherId}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Time of lecture is ${cubit.groups!.respone![index].teacher!.time}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Hall of lecture is ${cubit.groups!.respone![index].teacher!.hall}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Doctor of section is ${cubit.groups!.respone![index].session!.teacherIdSession}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Time of section is ${cubit.groups!.respone![index].session!.timeSession}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Hall of section is ${cubit.groups!.respone![index].session!.hallSession}",
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              cubit.groups!.respone!.length <
                                                      cubit.groups!.respone!
                                                              .length -
                                                          1
                                                  ? Divider()
                                                  : SizedBox()
                                            ],
                                          );
                                        })
                                    : const SizedBox(),
                              )
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
