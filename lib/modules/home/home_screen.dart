import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/get_id/get_id_screen.dart';
import 'package:graduation_project_app/modules/home/departments.dart';
import 'package:graduation_project_app/modules/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image(
              image: const AssetImage("assets/logo.png"),
              height: size.height * 0.2,
            ),
            ListTile(
              leading: const Icon(
                Icons.login,
                color: Colors.black,
              ),
              title: const Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                "Get ID",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetIdScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_balance,
                color: Colors.black,
              ),
              trailing: Icon(isOpen? Icons.arrow_drop_up : Icons.arrow_drop_down),
              title: const Text(
                'College Departments',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
            ),
            isOpen? Column(
              children: [
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Computer Science Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Computer Science Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Chemistry Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Computer Science Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Physics Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Physics Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Zoology Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Zoology Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Mathematics Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Mathematics Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Geology Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Geology Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Botany Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Botany Department",
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const SizedBox(),
                  title: const Text(
                    'Astrology Department',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CollegeDepartments(
                          image: "assets/logo.png",
                          description: "safasfaas",
                          titleAppbar: "Astrology Department",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ): SizedBox()
          ],
        ),
      ),
    );
  }
}