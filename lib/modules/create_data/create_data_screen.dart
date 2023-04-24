import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/create_Student/create_student.dart';
import 'package:graduation_project_app/modules/create_course/create_course.dart';
import 'package:graduation_project_app/modules/create_department/create_department.dart';
import 'package:graduation_project_app/modules/create_management/create_management.dart';

class CreateData extends StatelessWidget {
  const CreateData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.add,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              title: Text(
                "Create Course",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateCourseScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              title: Text(
                "Create Department",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateDepartmentScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              title: Text(
                "Create Management",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateManagementScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              title: Text(
                "Create Student",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateStudentScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
