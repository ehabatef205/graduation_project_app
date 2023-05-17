import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/doctor/update_profile_doctor/update_profile_doctor_screen.dart';
import 'package:graduation_project_app/modules/doctor/view_profile_doctor/cubit/cubit.dart';
import 'package:graduation_project_app/modules/doctor/view_profile_doctor/cubit/states.dart';

class ViewProfileDoctorScreen extends StatelessWidget {
  const ViewProfileDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewProfileDoctorCubit(),
      child: BlocConsumer<ViewProfileDoctorCubit, ViewProfileDoctorStates>(
        listener: (context , state){},
        builder: (context , state){
          ViewProfileDoctorCubit cubit = ViewProfileDoctorCubit.get(context);
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
                        builder: (context) => const UpdateProfileDoctorScreen(),
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/back2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : Abdallah Salama',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'ID : 1827060',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).textTheme.bodyText1!.color
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'GPA : 1.5',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Email : abdallahsalama808@gmail.com',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Address : sdaasfsfjshfsj',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Mobile Number : 01154280635',
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
