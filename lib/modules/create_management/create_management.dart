import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/create_management/cubit/cubit.dart';
import 'package:graduation_project_app/modules/create_management/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateManagementScreen extends StatelessWidget {
  const CreateManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateManagementCubit(),
      child: BlocConsumer<CreateManagementCubit, CreateManagementStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreateManagementCubit cubit = CreateManagementCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Management",
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
                      controller: cubit.managementIdController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Management ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementNameController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Management Name",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementEmailController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Management Email",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Email is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementPasswordController,
                      type: TextInputType.visiblePassword,
                      context: context,
                      labelText: "Management Password",
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
                          return "Management Password is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementBirthDayController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Management Birth Day",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Birth Day is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementPhoneController,
                      type: TextInputType.phone,
                      context: context,
                      labelText: "Management Phone",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Phone is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementMobileController,
                      type: TextInputType.phone,
                      context: context,
                      labelText: "Management Mobile",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Mobile is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementNATIDController,
                      type: TextInputType.number,
                      context: context,
                      labelText: "Management NAT ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management NAT ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementAddressController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Management Address",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Management Address is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.managementDepartmentController,
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
