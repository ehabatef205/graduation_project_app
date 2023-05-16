import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/view_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_student/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class ViewStudentScreen extends StatelessWidget {
  const ViewStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ViewStudentCubit(),
      child: BlocConsumer<ViewStudentCubit, ViewStudentStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewStudentCubit cubit = ViewStudentCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'View Student',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      type: TextInputType.name,
                      controller: cubit.nameController,
                      context: context,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      labelText: "Search",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ListTile(
                            subtitle: Text(
                              "1827060",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 14.0,
                              ),
                            ),
                            title: Text(
                              "Abdallah Salama Abdallah",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 18.0,
                              ),
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/back2.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
