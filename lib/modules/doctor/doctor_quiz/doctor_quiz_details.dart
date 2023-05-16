import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_quiz_grades/create_quiz_grades.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_quiz/cubit/states.dart';

class DoctorQuizDetailsScreen extends StatelessWidget {
  const DoctorQuizDetailsScreen({Key? key}) : super(key: key);

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
                  "Quiz 1",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateQuizGradesScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Grades",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18.0),
                        ),
                        const SizedBox(
                          width: 220.0,
                        ),
                        Text(
                          "10 / 10",
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      "Comment",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'hahfkasgdhfgjhkdsfbhbabvuidnjksfnjkdshfjkjsafk'
                      'asndakjsfhjkasfhjkasfhjkashfjkashfjkhaksjfhj'
                      'asjhfakjsfhjkashfjkahsfjkhakfhajshfjkhaksjfh'
                      'ajkshfjkashfkjhaksjhfkjhaskjfhjkahsfkjahsjfh'
                      'ajshfkahsfjkahsfkjahsfajkshfjkahkjfhjkkasfhk'
                      'askjdalkfjlaksjfklasjflakjsfkajsfllasfjaklaklsfj',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
