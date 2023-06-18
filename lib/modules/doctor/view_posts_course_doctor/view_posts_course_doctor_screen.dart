import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/doctor/create_post_doctor/create_post_doctor.dart';
import 'package:graduation_project_app/modules/doctor/view_comments_doctor/view_comments_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/view_posts_course_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/view_posts_course_doctor/cubit/states.dart';
import 'package:graduation_project_app/modules/student/view_comments/view_comments_screen.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class ViewPostsCourseDoctorScreen extends StatelessWidget {
  final String course_id;

  const ViewPostsCourseDoctorScreen({Key? key, required this.course_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (BuildContext context) =>
            ViewPostsCourseDoctorCubit()..postOfDoctor(courseId: course_id),
        child: BlocConsumer<ViewPostsCourseDoctorCubit,
            ViewPostsCourseDoctorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ViewPostsCourseDoctorCubit cubit =
                ViewPostsCourseDoctorCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppScreen(
                            userType: management!.userType!,
                            indexOfScreen: 0)));
                return Future.value(true);
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    course_id,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppScreen(
                                  userType: management!.userType!,
                                  indexOfScreen: 0)));
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  actions: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CreatePostDoctorScreen(courseId: course_id),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return cubit.postOfDoctor(courseId: course_id);
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
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                    Row(
                                                      children: [
                                                        Text(
                                                          cubit
                                                              .postModel!
                                                              .respone![index]
                                                              .managementName!,
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .color,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          cubit
                                                                  .postModel!
                                                                  .respone![
                                                                      index]
                                                                  .hidden!
                                                              ? Icons
                                                                  .visibility_off_outlined
                                                              : Icons
                                                                  .visibility_outlined,
                                                          color:
                                                              Theme.of(context)
                                                                  .iconTheme
                                                                  .color,
                                                          size: 15,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "${cubit.postModel!.respone![index].dateTime!.split("T")[0]} ${cubit.postModel!.respone![index].dateTime!.split("T")[1].split(".")[0]}",
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
                                            PopupMenuButton<int>(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              icon: Icon(
                                                Icons.more_horiz_rounded,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                              onSelected: (value) {
                                                if (value == 1) {
                                                  cubit
                                                      .deletePost(index: index)
                                                      .whenComplete(() {
                                                    cubit.postOfDoctor(
                                                        courseId: course_id);
                                                  });
                                                }
                                                if (value == 2) {
                                                  cubit.updateHidden(
                                                      index: index);
                                                }
                                              },
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete_outline,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Delete Post",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .color),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 2,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        cubit
                                                                .postModel!
                                                                .respone![index]
                                                                .hidden!
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        cubit
                                                                .postModel!
                                                                .respone![index]
                                                                .hidden!
                                                            ? "Show"
                                                            : "Hidden",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .color),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          cubit
                                              .postModel!.respone![index].text!,
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
                                        cubit.postModel!.respone![index]
                                                    .image! ==
                                                ""
                                            ? const SizedBox()
                                            : Column(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(cubit
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
                                                        ViewCommentsDoctorScreen(
                                                      list: cubit.postModel!
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
                                                    cubit
                                                        .postModel!
                                                        .respone![index]
                                                        .comments!
                                                        .length
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
              ),
            );
          },
        ));
  }
}
