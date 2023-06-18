import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_quiz_grades/create_quiz_grades.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/doctor_exams.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz_details.dart';
import 'package:graduation_project_app/shared/color.dart';

class DoctorQuizScreen extends StatelessWidget {
  final Respone group;

  const DoctorQuizScreen({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          DoctorQuizCubit()..getGroupData(group: group),
      child: BlocConsumer<DoctorQuizCubit, DoctorQuizStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorQuizCubit cubit = DoctorQuizCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DoctorExamsScreen(course_id: group.courseId!)));
                return Future.value(true);
              },
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: Text(
                    "Quizzes",
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
                              builder: (context) => DoctorExamsScreen(
                                  course_id: group.courseId!)));
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
                              builder: (context) =>
                                  CreateQuizGradesScreen(group: group),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).iconTheme.color,
                        ))
                  ],
                ),
                body: cubit.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: colorButton,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: cubit.groupData!.quizzes!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    "Quiz ${index + 1}",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorQuizDetailsScreen(
                                                group: cubit.groupData!,
                                                index: index),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ),
            );
          }),
    );
  }
}
