import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/doctor_exams.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz.dart';
import 'package:graduation_project_app/modules/doctor/doctor_view_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_view_student/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class DoctorViewStudentScreen extends StatelessWidget {
  final String course_id;

  const DoctorViewStudentScreen({Key? key, required this.course_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      DoctorViewStudentCubit()
        ..getStudent(course_id: course_id),
      child: BlocConsumer<DoctorViewStudentCubit, DoctorViewStudentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          DoctorViewStudentCubit cubit = DoctorViewStudentCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DoctorExamsScreen(course_id: course_id,)));
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Students',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .color,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DoctorExamsScreen(course_id: course_id,)));
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme
                        .of(context)
                        .iconTheme
                        .color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: cubit.isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    color: colorButton,
                  ),
                ) : ListView.builder(
                    itemCount: cubit.students.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cubit.students[index], style: TextStyle(
                            color: Theme
                                .of(context)
                                .textTheme
                                .bodyText1!
                                .color),),
                      );
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
