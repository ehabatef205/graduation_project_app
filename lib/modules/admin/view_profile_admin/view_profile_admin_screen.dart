import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/update_profile_admin/update_profile_admin_screen.dart';
import 'package:graduation_project_app/modules/admin/view_profile_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_profile_admin/cubit/states.dart';
import 'package:graduation_project_app/shared/constant.dart';

class ViewProfileAdminScreen extends StatelessWidget {
  const ViewProfileAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewProfileAdminCubit(),
      child: BlocConsumer<ViewProfileAdminCubit, ViewProfileAdminStates>(
        listener: (context , state){},
        builder: (context , state){
          ViewProfileAdminCubit cubit = ViewProfileAdminCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 25.0
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfileAdminScreen(),
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
              padding: const EdgeInsets.all(10),
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
                            image: NetworkImage(management!.image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : ${management!.name}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'ID : ${management!.managementId}',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'Email : ${management!.email}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'Address : ${management!.address}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'Mobile Number : ${management!.mobile}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'Phone Number : ${management!.phone}',
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
          );
        },
      ),
    );
  }
}
