import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_app/layout/app_layout.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/shared/color.dart';
import 'package:graduation_project_app/shared/components.dart';
import 'package:graduation_project_app/shared/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void sign() async {
    setState(() {
      isLoading = true;
    });
    print(password);
    if (passwordController.text == password) {
      AppCubit.get(context).getData().whenComplete(() async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        await sharedPreferences
            .setString("token", token!)
            .whenComplete(() async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AppScreen(
                        userType: userType!,
                        indexOfScreen: 0,
                      )));
        });
      });
    } else {
      print("Hello");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Enter password',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const SizedBox(),
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormFieldWidget(
                            controller: passwordController,
                            context: context,
                            type: TextInputType.text,
                            obscureText: true,
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.account_box_outlined,
                              color: Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "National id is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          isLoading
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
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        sign();
                                      }
                                    },
                                    color: Colors.green[600],
                                    height: 50.0,
                                    child: const Text(
                                      'Get ID',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
