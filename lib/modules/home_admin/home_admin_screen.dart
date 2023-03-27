import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/view_table/view_courses_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Home Admin',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Admin name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Admin id",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                "View Courses",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ViewCoursesScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
