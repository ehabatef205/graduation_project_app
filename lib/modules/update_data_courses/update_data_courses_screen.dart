import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/update_data_courses/cubit/cubit.dart';
import 'package:graduation_project_app/modules/update_data_courses/cubit/states.dart';
import 'package:graduation_project_app/modules/view_table_courses/view_courses_screen.dart';


class UpdateDataCoursesScreen extends StatelessWidget {
  final String courseName;
  final String doctor;
  final String teachingAssistant;
  final int groups;
  const UpdateDataCoursesScreen({Key? key, required this.courseName, required this.doctor, required this.groups, required this.teachingAssistant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateDataCoursesCubit(),
      child: BlocConsumer< UpdateDataCoursesCubit , UpdateDataCoursesStates >(
        listener: (context, state) {},
        builder: (context, state) {
          UpdateDataCoursesCubit cubit = UpdateDataCoursesCubit.get(context);
          cubit.initialText(courseName, doctor, teachingAssistant, groups);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              centerTitle: true,
              title: const Text(
                'Update Courses',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20.0 , left: 10.0 , right: 10.0 , bottom: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: cubit.courseController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Course',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.account_box,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Course is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: cubit.doctorController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Doctor',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.account_box,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Doctor is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: cubit.teachingAssistantController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Teaching Assistant',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.account_box,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Teaching Assistant is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: cubit.groupController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Groups',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                          Icons.account_box,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Number of Groups is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewCoursesScreen()
                            )
                          );
                        },
                        color: Colors.black87,
                        height: 50.0,
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
