import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/admin/create_management/create_management.dart';
import 'package:graduation_project_app/modules/admin/view_admin_profile/view_admin_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/view_admins/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_admins/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';
import 'package:graduation_project_app/shared/constant.dart';

class ViewAdminsScreen extends StatelessWidget {
  const ViewAdminsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ViewAdminsCubit()..getAdims(),
      child: BlocConsumer<ViewAdminsCubit, ViewAdminsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewAdminsCubit cubit = ViewAdminsCubit.get(context);
          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppScreen(
                          userType: management!.userType!, indexOfScreen: 3)));
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'View Admins',
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
                                indexOfScreen: 3)));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CreateManagementScreen(user: "admin")));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormFieldWidget(
                        type: TextInputType.name,
                        controller: cubit.nameController,
                        context: context,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                        labelText: "Search",
                        onChanged: (value) => cubit.onChanged(value!),
                      ),
                    ),
                    cubit.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: colorButton,
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: cubit.managementsModel!.data!.length,
                              itemBuilder: (context, index) {
                                var data = cubit.managementsModel!.data!;
                                if (data[index]
                                        .managementId
                                        .toString()
                                        .toLowerCase()
                                        .startsWith(
                                            cubit.search.toLowerCase()) ||
                                    data[index]
                                        .name
                                        .toString()
                                        .toLowerCase()
                                        .startsWith(
                                            cubit.search.toLowerCase())) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewAdminProfileScreen(
                                                        adminDate:
                                                            data[index])));
                                      },
                                      subtitle: Text(
                                        data[index].managementId!,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      title: Text(
                                        data[index].name!,
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
                                              image: NetworkImage(
                                                data[index].image!,
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
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
