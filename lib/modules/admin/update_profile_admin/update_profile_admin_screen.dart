import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/admin/update_profile_admin/cubit/cubit.dart';
import 'package:graduation_project_app/modules/admin/update_profile_admin/cubit/states.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';
import 'package:graduation_project_app/shared/constant.dart';

class UpdateProfileAdminScreen extends StatelessWidget {
  const UpdateProfileAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileAdminCubit()..completeText(),
      child: BlocConsumer<UpdateProfileAdminCubit, UpdateProfileAdminStates>(
        listener: (context, state) {},
        builder: (context, state) {
          UpdateProfileAdminCubit cubit = UpdateProfileAdminCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
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
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(management!.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            '${management!.name}',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            '${management!.managementId}',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).textTheme.bodyText1!.color
                            ),
                          ),
                          const SizedBox(height: 10,),
                          TextFormFieldWidget(
                            controller: cubit.emailController,
                            type: TextInputType.emailAddress,
                            context: context,
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormFieldWidget(
                            controller: cubit.addressController,
                            type: TextInputType.streetAddress,
                            context: context,
                            labelText: "Address",
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Address is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormFieldWidget(
                            controller: cubit.phoneController,
                            type: TextInputType.phone,
                            context: context,
                            labelText: "Phone",
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Phone is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormFieldWidget(
                            controller: cubit.mobileController,
                            type: TextInputType.phone,
                            context: context,
                            labelText: "Mobile Number",
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "Mobile Number is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          cubit.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: colorButton,
                                  ),
                                )
                              : Container(
                            width: double.infinity,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.formKey.currentState!.save();
                                  cubit.updateProfileAdmin(context: context);
                                }
                              },
                              color: Colors.green[600],
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
            ),
          );
        },
      ),
    );
  }
}
