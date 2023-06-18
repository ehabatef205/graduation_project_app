import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/course_model.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/create_group/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/create_group/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateGroupScreen extends StatelessWidget {
  final Respone department;
  final Course course;

  const CreateGroupScreen({Key? key, required this.course, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CreateGroupCubit()..getDoctors(department: course.department!),
      child: BlocConsumer<CreateGroupCubit, CreateGroupStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CreateGroupCubit cubit = CreateGroupCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  course.courseId!,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: cubit.isLoading2
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colorButton,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: cubit.groupNumberController,
                              type: TextInputType.number,
                              context: context,
                              labelText: "Group number",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Group number is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.studentNumberController,
                              type: TextInputType.number,
                              context: context,
                              labelText: "Students number",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Students number is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      onEditingComplete: () {
                                        FocusScope.of(context).nextFocus();
                                      },
                                      keyboardType: TextInputType.text,
                                      enabled: false,
                                      controller: cubit.doctorLectureController,
                                      minLines: 1,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 18),
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Doctor Lecture",
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
                                      items: cubit.doctors.map((item) {
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
                                        cubit.changeDoctorLecture(newValue!);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                            keyboardType: TextInputType.text,
                                            enabled: false,
                                            controller:
                                                cubit.dayLectureController,
                                            minLines: 1,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                                fontSize: 18),
                                            decoration: InputDecoration(
                                              filled: true,
                                              hintText: "Day Lecture",
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color!
                                                      .withOpacity(0.5)),
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                            iconEnabledColor: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            items: cubit.days.map((item) {
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
                                              cubit.changeDayLecture(newValue!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                            keyboardType: TextInputType.text,
                                            enabled: false,
                                            controller:
                                                cubit.timeLectureController,
                                            minLines: 1,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                                fontSize: 18),
                                            decoration: InputDecoration(
                                              filled: true,
                                              hintText: "Time Lecture",
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color!
                                                      .withOpacity(0.5)),
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                            iconEnabledColor: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            items: cubit.time.map((item) {
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
                                              cubit
                                                  .changeTimeLecture(newValue!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.hallLectureController,
                              type: TextInputType.text,
                              context: context,
                              labelText: "Hall Lecture",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Hall Lecture number is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      onEditingComplete: () {
                                        FocusScope.of(context).nextFocus();
                                      },
                                      keyboardType: TextInputType.text,
                                      enabled: false,
                                      controller: cubit.doctorSectionController,
                                      minLines: 1,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 18),
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Doctor Section",
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
                                      items: cubit.doctors.map((item) {
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
                                        cubit.changeDoctorSection(newValue!);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                            keyboardType: TextInputType.text,
                                            enabled: false,
                                            controller:
                                                cubit.daySectionController,
                                            minLines: 1,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                                fontSize: 18),
                                            decoration: InputDecoration(
                                              filled: true,
                                              hintText: "Day Section",
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color!
                                                      .withOpacity(0.5)),
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                            iconEnabledColor: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            items: cubit.days.map((item) {
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
                                              cubit.changeDaySection(newValue!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            },
                                            keyboardType: TextInputType.text,
                                            enabled: false,
                                            controller:
                                                cubit.timeSectionController,
                                            minLines: 1,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color,
                                                fontSize: 18),
                                            decoration: InputDecoration(
                                              filled: true,
                                              hintText: "Time Section",
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color!
                                                      .withOpacity(0.5)),
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                            iconEnabledColor: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            items: cubit.time.map((item) {
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
                                              cubit
                                                  .changeTimeSection(newValue!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.hallSectionController,
                              type: TextInputType.number,
                              context: context,
                              labelText: "Hall Section",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Hall Section is required";
                                }
                                return null;
                              },
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
                                        cubit.addGroup(
                                            context: context, course: course, department: department);
                                      },
                                      color: Colors.green[600],
                                      height: 50.0,
                                      child: const Text(
                                        'Add Group',
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
          }),
    );
  }
}
