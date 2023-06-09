import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/get_id/cubit/cubit.dart';
import 'package:graduation_project_app/modules/get_id/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class GetIdScreen extends StatefulWidget {
  const GetIdScreen({Key? key}) : super(key: key);

  @override
  State<GetIdScreen> createState() => _GetIdScreenState();
}

class _GetIdScreenState extends State<GetIdScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetIdCubit(),
      child: BlocConsumer<GetIdCubit, GetIdStates>(
          listener: (context, state) {},
          builder: (context, state) {
            GetIdCubit cubit = GetIdCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Get ID',
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
                        cubit.isPressed
                            ? Form(
                                key: cubit.formKey2,
                                child: cubit.isPressed
                                    ? Column(
                                        children: [
                                          Text(
                                            'ID : ${cubit.id}',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color,
                                            ),
                                          ),
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
                                          cubit.loading? Center(
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
                                                cubit.updatePassword();
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
                                    : const SizedBox(),
                              )
                            : Form(
                                key: cubit.formKey,
                                child: Column(
                                  children: [
                                    TextFormFieldWidget(
                                      controller: cubit.nationalIdController,
                                      context: context,
                                      type: TextInputType.number,
                                      labelText: 'National ID',
                                      prefixIcon: Icon(
                                        Icons.account_box_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "National id is required";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    TextFormFieldWidget(
                                      controller:
                                          cubit.highSchoolDegreeController,
                                      context: context,
                                      type: TextInputType.number,
                                      labelText: 'High School Degree',
                                      prefixIcon: Icon(
                                        Icons.score_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "High school degree is required";
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
                                                if (cubit.formKey.currentState!
                                                    .validate()) {
                                                  cubit.formKey.currentState!
                                                      .save();
                                                  cubit.getId();
                                                }
                                              },
                                              color: Colors.green[600],
                                              height: 50.0,
                                              child: const Text(
                                                'Get ID',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                  ],
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
