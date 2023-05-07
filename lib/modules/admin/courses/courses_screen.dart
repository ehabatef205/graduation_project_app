import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/create_course/create_course.dart';
import 'package:graduation_project_app/modules/admin/courses/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/courses/cubit/states.dart';
import 'package:graduation_project_app/modules/admin/create_department/create_department.dart';
import 'package:graduation_project_app/modules/admin/view_course/view_course.dart';
import 'package:graduation_project_app/shared/color.dart';

class CoursesScreen extends StatelessWidget {
  final String department;

  const CoursesScreen({Key? key, required this.department}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) =>
            CoursesCubit()..getCourses(department: department),
        child: BlocConsumer<CoursesCubit, CoursesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CoursesCubit cubit = CoursesCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  department,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                actions: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateCourseScreen(department: department),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateDepartmentScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () {
                    return cubit.getCourses(department: department);
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
                            itemCount: cubit.courses!.respone!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).scaffoldBackgroundColor,
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
                                              ViewCourseScreen(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                                            .respone![index].image!,
                                                      ),
                                                      fit: BoxFit.cover)),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cubit.courses!.respone![index]
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
          },
        ));
  }
}
