import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_quiz_grades/create_quiz_grades.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/states.dart';

class DoctorQuizDetailsScreen extends StatelessWidget {
  final Respone group;
  final int index;

  const DoctorQuizDetailsScreen(
      {Key? key, required this.group, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorQuizCubit(),
      child: BlocConsumer<DoctorQuizCubit, DoctorQuizStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorQuizCubit cubit = DoctorQuizCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Quiz ${index + 1}",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: group.quizzes![index].length,
                    itemBuilder: (context, index2) {
                      return ListTile(
                          title: Text(
                            group.quizzes![index][index2]["student_id"],
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color,
                            ),
                          ),
                          trailing: Text(
                            group.quizzes![index][index2]["grad"],
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color,
                            ),
                          ),
                      );
                    }),
              ),
            );
          }),
    );
  }
}
