import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/home_admin/home_admin_screen.dart';
import 'package:graduation_project_app/modules/home_student/home_student_screen.dart';
import 'package:graduation_project_app/modules/login/cubit/cubit.dart';
import 'package:graduation_project_app/modules/login/cubit/states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black87,
                centerTitle: true,
                title: const Text(
                  'Account Login',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          //Student Code
                          TextFormField(
                            controller: cubit.idController,
                            keyboardType: TextInputType.number,
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
                              labelText: 'ID Code',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.account_box,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ID is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //Pass Code
                          TextFormField(
                            controller: cubit.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.isPassword,
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
                              labelText: 'Password',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  cubit.isPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  cubit.passwordChange();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //LogIn
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeAdminScreen()));
                                }
                              },
                              color: Colors.black87,
                              height: 50.0,
                              child: const Text(
                                'Login',
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
          }),
    );
  }
}
