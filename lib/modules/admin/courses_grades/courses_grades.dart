import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/department_model.dart';
import 'package:graduation_project_app/modules/admin/courses_grades/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/courses_grades/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/final_grades/final_grades.dart';
import 'package:graduation_project_app/shared/color.dart';

class CoursesGradesScreen extends StatelessWidget {
  final Respone department;

  const CoursesGradesScreen({Key? key, required this.department})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CoursesGradesCubit()
        ..getCourses(department: department.departmentId!),
      child: BlocConsumer<CoursesGradesCubit, CoursesGradesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CoursesGradesCubit cubit = CoursesGradesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Courses Grades",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () {
                    return cubit.getCourses(
                        department: department.departmentId!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: cubit.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: colorButton,
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: cubit.courses!.course!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FinalGradesScreen(
                                            course_id: cubit.courses!
                                                .course![index].courseId!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    cubit.courses!
                                                        .course![index].image!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cubit.courses!.course![index]
                                              .courseId!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
