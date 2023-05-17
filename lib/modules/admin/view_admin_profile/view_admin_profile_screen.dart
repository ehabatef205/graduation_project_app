import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/update_admin_profile/update_admin_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/update_student_profile/update_student_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/view_admin_profile/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_admin_profile/cubit/states.dart';

class ViewAdminProfileScreen extends StatelessWidget {
  final Data adminDate;

  const ViewAdminProfileScreen({Key? key, required this.adminDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAdminProfileCubit(),
      child: BlocConsumer<ViewAdminProfileCubit, ViewAdminProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewAdminProfileCubit cubit = ViewAdminProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Admin Profile",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 25.0),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateAdminProfileScreen(adminDate: adminDate),
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
                            image: NetworkImage(adminDate!.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${adminDate!.name}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ID : ${adminDate!.managementId}',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email : ${adminDate!.email}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Address : ${adminDate!.address}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mobile Number : ${adminDate!.mobile}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Phone Number : ${adminDate!.phone}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ],
                      )
                    ],
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
