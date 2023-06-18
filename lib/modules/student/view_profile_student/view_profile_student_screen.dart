import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/student/update_profile_student/update_profile_screen.dart';
import 'package:graduation_project_app/modules/student/view_profile_student/cubit/cubit.dart';
import 'package:graduation_project_app/modules/student/view_profile_student/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';

class ViewProfileStudentScreen extends StatelessWidget {
  const ViewProfileStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewProfileStudentCubit(),
      child: BlocConsumer<ViewProfileStudentCubit, ViewProfileStudentStates>(
        listener: (context , state){},
        builder: (context , state){
          ViewProfileStudentCubit cubit = ViewProfileStudentCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppScreen(
                          userType: student!.userType!, indexOfScreen: 3)));
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 25.0
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppScreen(
                                userType: student!.userType!,
                                indexOfScreen: 3)));
                  },
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateProfileStudentScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(student!.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${student!.name}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'ID : ${student!.studentId}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.bodyText1!.color
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'GPA : 1.5',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Email : ${student!.email}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Address : ${student!.address}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Mobile Number : ${student!.mobile}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Phone Number : ${student!.phone}',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
