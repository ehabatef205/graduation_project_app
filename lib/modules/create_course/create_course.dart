import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_course/cubit/cubit.dart';
import 'package:graduation_project_app/modules/create_course/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateCourseCubit(),
      child: BlocConsumer<CreateCourseCubit, CreateCourseStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreateCourseCubit cubit = CreateCourseCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Course",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormFieldWidget(
                      controller: cubit.courseIdController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Course ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Course ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.courseNameController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Course Name",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Course Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.courseDesController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Course Description",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Course Description is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.courseCreditController,
                      type: TextInputType.number,
                      context: context,
                      labelText: "Course Credit",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Course Credit is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.departementController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Department",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Department is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.courseLevelController,
                      type: TextInputType.number,
                      context: context,
                      labelText: "course Level",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "course Level is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.green[600],
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