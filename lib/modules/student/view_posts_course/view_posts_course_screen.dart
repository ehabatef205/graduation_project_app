import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/view_posts_course/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/view_posts_course/cubit/states.dart';
import 'package:graduation_project_app/modules/student/view_comments/view_comments_screen.dart';
import 'package:graduation_project_app/shared/color.dart';

class ViewPostsCourseScreen extends StatelessWidget {
  final String courseId;

  const ViewPostsCourseScreen({Key? key, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) =>
            ViewPostsCourseCubit()..postOfCourse(courseId: courseId),
        child: BlocConsumer<ViewPostsCourseCubit, ViewPostsCourseStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewPostsCourseCubit cubit = ViewPostsCourseCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  courseId,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              body: SafeArea(
                child: RefreshIndicator(
                  onRefresh: () {
                    return cubit.postOfCourse(courseId: courseId);
                  },
                  child: cubit.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colorButton,
                          ),
                        )
                      : ListView.builder(
                          itemCount: cubit.postModel!.respone!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 5, top: 5, left: 10, right: 10),
                              child: Container(
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(cubit
                                                        .postModel!
                                                        .respone![index]
                                                        .managementImage!),
                                                    fit: BoxFit.fill)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cubit.postModel!.respone![index]
                                                    .managementName!,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                cubit.postModel!.respone![index]
                                                    .dateTime!,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        cubit.postModel!.respone![index].text!,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      cubit.postModel!.respone![index].image! ==
                                              ""
                                          ? const SizedBox()
                                          : Column(
                                              children: [
                                                Image(
                                                  image: AssetImage(cubit
                                                      .postModel!
                                                      .respone![index]
                                                      .image!),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                      const Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SizedBox(
                                          width: size.width,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewCommentsScreen(
                                                    list: cubit
                                                        .postModel!
                                                        .respone![index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons
                                                      .messenger_outline_outlined,
                                                  size: 20,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  cubit.postModel!.respone![index]
                                                      .comments!.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Comments",
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            );
          },
        ));
  }
}
