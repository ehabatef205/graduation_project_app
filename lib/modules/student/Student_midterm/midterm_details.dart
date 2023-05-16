import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/cubit/states.dart';
import 'package:graduation_project_app/modules/student/Student_midterm/student_midterm.dart';
import 'package:graduation_project_app/shared/components.dart';

class MidTermDetailsScreen extends StatelessWidget {
  const MidTermDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StudentMidTermCubit(),
      child: BlocConsumer<StudentMidTermCubit, StudentMidTermStates>(
          listener: (context, state) {},
          builder: (context, state) {
            StudentMidTermCubit cubit = StudentMidTermCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "MidTerm 1",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
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
                          color:
                          Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 20.0),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      'hahfkasgdhfgjhkdsfbhbabvuidnjksfnjkdshfjkjsafk'
                          'asndakjsfhjkasfhjkasfhjkashfjkashfjkhaksjfhj'
                          'asjhfakjsfhjkashfjkahsfjkhakfhajshfjkhaksjfh'
                          'ajkshfjkashfkjhaksjhfkjhaskjfhjkahsfkjahsjfh'
                          'ajshfkahsfjkahsfkjahsfajkshfjkahkjfhjkkasfhk'
                          'askjdalkfjlaksjfklasjflakjsfkajsfllasfjaklaklsfj',
                      style: TextStyle(
                          color:
                          Theme.of(context).textTheme.bodyText1!.color,
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