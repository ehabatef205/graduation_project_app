import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/students_model.dart';
import 'package:graduation_project_app/modules/admin/update_student_profile/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/update_student_profile/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';
import 'package:graduation_project_app/shared/constant.dart';

class UpdateStudentProfileScreen extends StatelessWidget {
  final Data studentDate;
  const UpdateStudentProfileScreen({Key? key, required this.studentDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateStudentProfileCubit()..completeText(studentDate: studentDate),
      child:
          BlocConsumer<UpdateStudentProfileCubit, UpdateStudentProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UpdateStudentProfileCubit cubit =
              UpdateStudentProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Update Profile",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 25.0),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.chooseImage();
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(studentDate.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${studentDate.name}',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${studentDate.studentId}',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Student GPA',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldWidget(
                            controller: cubit.emailController,
                            type: TextInputType.emailAddress,
                            context: context,
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldWidget(
                            controller: cubit.addressController,
                            type: TextInputType.streetAddress,
                            context: context,
                            labelText: "Address",
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Address is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldWidget(
                            controller: cubit.phoneController,
                            type: TextInputType.phone,
                            context: context,
                            labelText: "Phone",
                            prefixIcon: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Phone is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldWidget(
                            controller: cubit.mobileController,
                            type: TextInputType.phone,
                            context: context,
                            labelText: "Mobile Number",
                            prefixIcon: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Mobile Number is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
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
                                      if (cubit.formKey.currentState!
                                          .validate()) {
                                        cubit.formKey.currentState!.save();
                                        cubit.updateProfileStudent(
                                            context: context, studentDate: studentDate);
                                      }
                                    },
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
