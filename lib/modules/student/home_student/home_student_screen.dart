import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/student/home_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/home_student/cubit/states.dart';
import 'package:graduation_project_app/modules/student/view_comments/view_comments_screen.dart';
import 'package:graduation_project_app/modules/student/view_posts_course/view_posts_course_screen.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/constant.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeStudentCubit, HomeStudentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeStudentCubit cubit = HomeStudentCubit.get(context);
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
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(loginStudentModel!.data!.image!),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        loginStudentModel!.data!.name!,
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
                Center(
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.post.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              cubit.changeIndex(index);
                              cubit.controller.animateToPage(index,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  cubit.post[index],
                                  style: TextStyle(
                                    color: cubit.index == index
                                        ? Colors.green[600]
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: cubit.controller,
                    onPageChanged: (newIndex) {
                      cubit.changeIndex(newIndex);
                    },
                    children: [
                      RefreshIndicator(
                        onRefresh: () {
                          return cubit.postOfAdmin();
                        },
                        child: cubit.isLoading? Center(child: CircularProgressIndicator(color: colorButton,),) : ListView.builder(
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
                                      color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.2),
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
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        cubit.postModel!.respone![index].managementImage!),
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
                                                cubit.postModel!.respone![index].managementName!,
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
                                      cubit.postModel!.respone![index].image! == ""
                                          ? const SizedBox()
                                          : Column(
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                                cubit.postModel!.respone![index].image!),
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
                                                        list: cubit.postModel!.respone![index],
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
                                                      .postModel!.respone![index].comments!
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
                                            ViewPostsCourseScreen(
                                              courseId: cubit.course[index]
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
