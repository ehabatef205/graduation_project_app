import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/home_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/home_doctor/cubit/states.dart';
import 'package:graduation_project_app/modules/doctor/view_posts_course_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/view_posts_course_doctor/view_posts_course_doctor_screen.dart';
import 'package:graduation_project_app/modules/view_comments/view_comments_screen.dart';
import 'package:graduation_project_app/modules/student/view_posts_course/view_posts_course_screen.dart';

class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) => HomeDoctorCubit(),
        child: BlocConsumer<HomeDoctorCubit, HomeDoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeDoctorCubit cubit = HomeDoctorCubit.get(context);
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/back2.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Doctor name",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: cubit.course.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.2),
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
                                          ViewPostsCourseDoctorScreen(
                                            course_id: cubit.course[index]
                                            ["course_id"],
                                          ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        cubit.course[index]["image"],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      cubit.course[index]["course_id"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}