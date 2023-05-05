import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/post_model.dart';
import 'package:graduation_project_app/modules/admin/view_comments_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_comments_admin/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class ViewCommentsAdminScreen extends StatelessWidget {
  final Respone list;

  const ViewCommentsAdminScreen({required this.list, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ViewCommentsAdminCubit()..updateRespone(list),
      child: BlocConsumer<ViewCommentsAdminCubit, ViewCommentsAdminStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewCommentsAdminCubit cubit = ViewCommentsAdminCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Comments",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: list.comments!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
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
                                                  image: NetworkImage(list
                                                      .comments![index].image!),
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
                                              list.comments![index].name!,
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
                                              "${cubit.respone!.comments![index].date!.split("T")[0]} ${cubit.respone!.comments![index].date!.split("T")[1].split(".")[0]}",
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
                                      list.comments![index].text!,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormFieldWidget(
                            controller: cubit.commentController,
                            type: TextInputType.text,
                            context: context,
                            hint: "Comment ...",
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (cubit.commentController.text.isNotEmpty &&
                                cubit.commentController.text
                                    .trim()
                                    .isNotEmpty) {
                              cubit.sendComment();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).iconTheme.color,
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
      ),
    );
  }
}
