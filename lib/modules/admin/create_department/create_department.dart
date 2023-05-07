import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_department/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/create_department/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateDepartmentScreen extends StatelessWidget {
  const CreateDepartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateDepartmentCubit(),
      child: BlocConsumer<CreateDepartmentCubit, CreateDepartmentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CreateDepartmentCubit cubit = CreateDepartmentCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Create Department",
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
                                ? IconButton(
                                    onPressed: () {
                                      cubit.chooseImage();
                                    },
                                    icon: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      color: Theme.of(context).iconTheme.color,
                                      size: 50,
                                    ),
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
                          controller: cubit.departmentIdController,
                          type: TextInputType.text,
                          context: context,
                          labelText: "Department ID",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Department ID is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormFieldWidget(
                          controller: cubit.departmentNameController,
                          type: TextInputType.text,
                          context: context,
                          labelText: "Department Name",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Department Name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormFieldWidget(
                          controller: cubit.departmentDesController,
                          type: TextInputType.text,
                          context: context,
                          maxLines: 10,
                          labelText: "Department Description",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Department Description is required";
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
                                    if (cubit.keyForm.currentState!
                                        .validate()) {
                                      cubit.keyForm.currentState!.save();
                                      cubit.addDepartment(context: context);
                                    }
                                  },
                                  color: Colors.green[600],
                                  height: 50.0,
                                  child: const Text(
                                    'Create Department',
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
