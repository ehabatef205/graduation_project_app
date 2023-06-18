import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/final_grades/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';

class FinalGradesScreen extends StatelessWidget {
  final String course_id;

  const FinalGradesScreen({Key? key, required this.course_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          FinalGradesCubit()..getStudent(course_id: course_id),
      child: BlocConsumer<FinalGradesCubit, FinalGradesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            FinalGradesCubit cubit = FinalGradesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Final Grades",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: cubit.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: colorButton,
                        ),
                      )
                    : Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.students.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ListTile(
                                    title: Text(
                                      cubit.students[index],
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color),
                                    ),
                                    trailing: SizedBox(
                                      width: 50,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .color!),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color!)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color!))),
                                        onChanged: (value) {
                                          cubit.changeFinal(index, value);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          cubit.isLoading2
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
                                      cubit.addFinal(course_id: course_id, context: context);
                                    },
                                    color: Colors.green[600],
                                    height: 50.0,
                                    child: const Text(
                                      'Create Final',
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
            );
          }),
    );
  }
}
