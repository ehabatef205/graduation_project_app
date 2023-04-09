import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/modules/logIn/cubit/cubit.dart';
import 'package:graduation_project_app/modules/logIn/cubit/states.dart';
import 'package:graduation_project_app/shared/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Color? color1 = Theme.of(context).textTheme.bodyText1!.color;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100.0,
                        ),
                        Text(
                          "LogIn",
                          style: TextStyle(
                            color: color1,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 200.0,
                        ),
                        TextFormFieldWidget(
                          controller: cubit.idController,
                          type: TextInputType.number,
                          context: context,
                          prefixIcon: Icon(
                            Icons.account_box,
                            color: color1,
                          ),
                          labelText: "ID Code",
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "ID is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormFieldWidget(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          context: context,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: color1,
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
                            color: color1,
                          ),
                          labelText: "Password",
                          obscureText: cubit.isPassword,
                          validate: (value) {
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
                                        builder: (context) => AppScreen()));
                              }
                            },
                            color: Colors.green[600],
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
        })
    );
  }
}
