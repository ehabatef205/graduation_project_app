import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/modules/admin/create_course/create_course.dart';
import 'package:graduation_project_app/modules/admin/update_course/update_course.dart';
import 'package:graduation_project_app/modules/admin/view_course/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_course/cubit/states.dart';

class ViewCourseScreen extends StatelessWidget {
  final Respone course;
  const ViewCourseScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ViewCourseCubit(),
      child: BlocConsumer<ViewCourseCubit, ViewCourseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewCourseCubit cubit = ViewCourseCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'View Course',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateCourseScreen(course: course),
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
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(course.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course ID : ${course.courseId}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Course Name : ${course.courseName}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Course Description : ${course.courseDescription}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Course Credit : ${course.courseCredit}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Department : ${course.department}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(
                            'Course Level : ${course.courseLevel}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
