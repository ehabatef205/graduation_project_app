import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_final_grade/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/create_final_grade/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/final_grades/final_grades.dart';
import 'package:graduation_project_app/shared/components.dart';

class CreateFinalGradeScreen extends StatelessWidget {
  const CreateFinalGradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CreateFinalGradeCubit(),
      child: BlocConsumer<CreateFinalGradeCubit, CreateFinalGradeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CreateFinalGradeCubit cubit = CreateFinalGradeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Create Final Grade",
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
                          builder: (context) => FinalGradesScreen(),
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
                            controller: cubit.finalGradeController,
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
                          " / 60",
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
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
          }),
    );
  }
}
