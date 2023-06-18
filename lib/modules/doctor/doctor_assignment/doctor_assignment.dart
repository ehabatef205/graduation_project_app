import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/groups_model.dart';
import 'package:graduation_project_app/modules/doctor/create_assignment/create_assignment.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_assignment/doctor_assignment_details.dart';
import 'package:graduation_project_app/modules/doctor/doctor_exams/doctor_exams.dart';
import 'package:graduation_project_app/shared/color.dart';

class DoctorAssignmentScreen extends StatelessWidget {
  final Respone group;

  const DoctorAssignmentScreen({Key? key, required this.group})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          DoctorAssignmentCubit()..getGroupData(group: group),
      child: BlocConsumer<DoctorAssignmentCubit, DoctorAssignmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DoctorAssignmentCubit cubit = DoctorAssignmentCubit.get(context);
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
                    "Assignments",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  centerTitle: true,
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
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CreateAssignmentScreen(group: group),
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
                              itemCount: cubit.groupData!.assignments!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    "Assignment ${index + 1}",
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
                                            DoctorAssignmentDetailsScreen(
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
