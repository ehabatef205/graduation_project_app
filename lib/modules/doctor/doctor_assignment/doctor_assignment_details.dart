import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/create_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class DoctorAssignmentDetailsScreen extends StatelessWidget {
  const DoctorAssignmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorAssignmentCubit(),
      child: BlocConsumer<DoctorAssignmentCubit, DoctorAssignmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorAssignmentCubit cubit = DoctorAssignmentCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Assignment 1",
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
                          builder: (context) => CreateAssignmentScreen(),
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
