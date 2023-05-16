import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/doctor_exams.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/doctor_quiz_details.dart';

class DoctorQuizScreen extends StatelessWidget {
  const DoctorQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 1;
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
                  "Quizzes",
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
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Quiz ${counter++}",
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
                              builder: (context) => DoctorQuizDetailsScreen(),
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
