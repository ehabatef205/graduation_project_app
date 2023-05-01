import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_post_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/create_post_doctor/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreatePostDoctorScreen extends StatelessWidget {
  const CreatePostDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreatePostDoctorCubit(),
      child: BlocConsumer<CreatePostDoctorCubit, CreatePostDoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreatePostDoctorCubit cubit = CreatePostDoctorCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Create Post",
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
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Theme.of(context).textTheme.bodyText1!.color!, width: 2)
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Theme.of(context).iconTheme.color,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.postIdController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Post ID",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Post ID is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormFieldWidget(
                      controller: cubit.postNameController,
                      type: TextInputType.text,
                      context: context,
                      labelText: "Post text",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Post text is required";
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
                          'Create post',
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