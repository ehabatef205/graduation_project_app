import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/managements_model.dart';
import 'package:graduation_project_app/modules/admin/update_doctor_profile/update_doctor_profile_screen.dart';
import 'package:graduation_project_app/modules/admin/view_doctor_profile/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/view_doctor_profile/cubit/states.dart';

class ViewDoctorProfileScreen extends StatelessWidget {
  final Data doctorDate;

  const ViewDoctorProfileScreen({Key? key, required this.doctorDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewDoctorProfileCubit(),
      child: BlocConsumer<ViewDoctorProfileCubit, ViewDoctorProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ViewDoctorProfileCubit cubit = ViewDoctorProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Doctor Profile",
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
                            UpdateDoctorProfileScreen(doctorDate: doctorDate),
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
                            image: NetworkImage(doctorDate!.image!),
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
                            'Name : ${doctorDate!.name}',
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
                            'ID : ${doctorDate!.managementId}',
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
                            'Email : ${doctorDate!.email}',
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
                            'Address : ${doctorDate!.address}',
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
                            'Mobile Number : ${doctorDate!.mobile}',
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
                            'Phone Number : ${doctorDate!.phone}',
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
