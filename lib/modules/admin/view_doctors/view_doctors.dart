import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/view_doctor_profile/view_doctor_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/view_student_profile/view_student_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_doctors/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';

class ViewDoctorsScreen extends StatelessWidget {
  const ViewDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ViewDoctorsCubit()..getDoctors(),
      child: BlocConsumer<ViewDoctorsCubit, ViewDoctorsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewDoctorsCubit cubit = ViewDoctorsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'View Doctors',
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
                                      .startsWith(cubit.search.toLowerCase()) ||
                                  data[index]
                                      .name
                                      .toString()
                                      .toLowerCase()
                                      .startsWith(cubit.search.toLowerCase())) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewDoctorProfileScreen(
                                                      doctorDate:
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
          );
        },
      ),
    );
  }
}
