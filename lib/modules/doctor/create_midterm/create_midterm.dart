import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/create_midterm/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/doctor_midterm/doctor_midterm_details.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateMidTermScreen extends StatelessWidget {
  const CreateMidTermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateMidTermCubit(),
      child: BlocConsumer<CreateMidTermCubit, CreateMidTermStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CreateMidTermCubit cubit = CreateMidTermCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Create MidTerm",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorMidTermDetailsScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.task_alt_outlined,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Grades",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ),
                      const SizedBox(
                        width: 230,
                      ),
                      SizedBox(
                        width: 50.0,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          controller: cubit.gradesController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Grade is required";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!
                                    .withOpacity(0.5)),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        " / 10",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormFieldWidget(
                    context: context,
                    controller: cubit.addCommentController,
                    type: TextInputType.text,
                    labelText: "Add Comment",
                    prefixIcon: Icon(
                      Icons.text_fields_outlined,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                    maxLines: 10,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  /*Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(25.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green[600],
                      height: 50.0,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
