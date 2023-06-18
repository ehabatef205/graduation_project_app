import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/modules/admin/update_course/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/update_course/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class UpdateCourseScreen extends StatelessWidget {
  final Course course;

  const UpdateCourseScreen({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UpdateCourseCubit()..completeText(respone: course),
      child: BlocConsumer<UpdateCourseCubit, UpdateCourseStates>(
          listener: (context, state) {},
          builder: (context, state) {
            UpdateCourseCubit cubit = UpdateCourseCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  course.courseId!,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.keyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color!,
                                    width: 2)),
                            child: cubit.image == null
                                ? Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          course.image!),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!,
                                      width: 2)),
                            )
                                : Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(cubit.image!.path)),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!,
                                            width: 2)),
                                  )),
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
                          maxLines: 10,
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
                        Container(
                          height: 66.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        onEditingComplete: () {
                                          FocusScope.of(context).nextFocus();
                                        },
                                        keyboardType: TextInputType.text,
                                        enabled: false,
                                        controller: cubit.courseLevelController,
                                        minLines: 1,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                            fontSize: 18),
                                        decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Course Level",
                                          hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color!
                                                  .withOpacity(0.5)),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        dropdownColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        iconEnabledColor:
                                            Theme.of(context).iconTheme.color,
                                        items: cubit.level.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item.toString(),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          cubit.changeLevel(newValue!);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        cubit.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorButton,
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (cubit.keyForm.currentState!.validate()) {
                                      cubit.keyForm.currentState!.save();
                                      cubit.updateDepartment(
                                          context: context,
                                          course: course.courseId!, department: course.department!);
                                    }
                                  },
                                  color: Colors.green[600],
                                  height: 50.0,
                                  child: const Text(
                                    'Update course',
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
              ),
            );
          }),
    );
  }
}
