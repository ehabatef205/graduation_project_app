import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/change_password_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/change_password_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class ChangePasswordDoctorScreen extends StatefulWidget {
  const ChangePasswordDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDoctorScreen> createState() => _ChangePasswordDoctorScreenState();
}

class _ChangePasswordDoctorScreenState extends State<ChangePasswordDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangePasswordDoctorCubit(),
      child: BlocConsumer<ChangePasswordDoctorCubit, ChangePasswordDoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ChangePasswordDoctorCubit cubit = ChangePasswordDoctorCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Change password',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, left: 25.0, right: 25.0, bottom: 25.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: cubit.formKey,
                          child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormFieldWidget(
                                      controller: cubit.changePassword,
                                      context: context,
                                      type: TextInputType.number,
                                      labelText: 'Change Password',
                                      prefixIcon: Icon(
                                        Icons.lock_outline_rounded,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "Password is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    cubit.loading
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: colorButton,
                                            ),
                                          )
                                        : Container(
                                            width: double.infinity,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                cubit.updatePassword(context: context);
                                              },
                                              color: Colors.green[600],
                                              height: 50.0,
                                              child: const Text(
                                                'Change Password',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                )
                        )
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
