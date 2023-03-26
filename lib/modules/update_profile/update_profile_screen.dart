import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/update_profile/cubit/cubit.dart';
import 'package:graduation_project_app/modules/update_profile/cubit/states.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UpdateProfileCubit cubit = UpdateProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              centerTitle: true,
              title: const Text(
                'Update profile',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            cubit.chooseImage();
                          },
                          child: Container(
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
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          'Student Name',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          'Student ID',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          'Student GPA',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'Email',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: cubit.addressController,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'Address',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Address is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: cubit.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'Phone',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: cubit.mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            labelText: 'Mobile Number',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Mobile Number is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.formKey.currentState!.save();
                              }
                            },
                            color: Colors.black87,
                            height: 50.0,
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
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
