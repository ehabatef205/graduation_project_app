import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_Student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/create_Student/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateStudentScreen extends StatelessWidget {
  const CreateStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateStudentCubit(),
      child: BlocConsumer<CreateStudentCubit, CreateStudentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreateStudentCubit cubit = CreateStudentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Student",
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
                      controller: cubit.studentIdController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentNameController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student Name",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentEmailController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student Email",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Email is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentPasswordController,
                      type: TextInputType.visiblePassword,
                      context: context,
                      labelText: "Student Password",
                      obscureText: cubit.isPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.passwordChange();
                        },
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Password is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentBirthDayController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student Birth Day",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Birth Day is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentPhoneController,
                      type: TextInputType.phone,
                      context: context,
                      labelText: "Student Phone",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Phone is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentMobileController,
                      type: TextInputType.phone,
                      context: context,
                      labelText: "Student Mobile",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Mobile is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentNATIDController,
                      type: TextInputType.number,
                      context: context,
                      labelText: "Student NAT ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student NAT ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentAddressController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student Address",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Address is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentDepartmentController,
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
                      controller: cubit.studentLevelController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Student Level",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Student Level is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.studentHighSchoolController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "High School",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "High School is required";
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
