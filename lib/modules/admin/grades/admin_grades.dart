import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/courses_grades/courses_grades.dart';
import 'package:graduation_project_app/modules/admin/grades/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/grades/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';

class AdminGradesScreen extends StatelessWidget {
  const AdminGradesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdminGradesCubit()..getDepartments(),
      child: BlocConsumer<AdminGradesCubit, AdminGradesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AdminGradesCubit cubit = AdminGradesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: const SizedBox(),
                title: Text(
                  "Department",
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
                    return cubit.getDepartments();
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
                            itemCount: cubit.departments!.respone!.length,
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
                                              CoursesGradesScreen(
                                            department: cubit
                                                .departments!.respone![index],
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
                                                    cubit.departments!
                                                        .respone![index].image!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cubit.departments!.respone![index]
                                              .departmentId!,
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
