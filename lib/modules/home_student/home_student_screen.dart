import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/update_profile/update_profile_screen.dart';
import 'package:graduation_project_app/modules/view_table/view_table_screen.dart';

class HomeStudentScreen extends StatefulWidget {
  const HomeStudentScreen({Key? key}) : super(key: key);

  @override
  State<HomeStudentScreen> createState() => _HomeStudentScreenState();
}

class _HomeStudentScreenState extends State<HomeStudentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Student Name',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/back2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Student name",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Student id",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            ListTile(
              leading: const Icon(
                Icons.table_rows_outlined,
                color: Colors.black,
              ),
              title: const Text(
                "Material Schedule",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewTableScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.update,
                color: Colors.black,
              ),
              title: const Text(
                "Update Profile",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
