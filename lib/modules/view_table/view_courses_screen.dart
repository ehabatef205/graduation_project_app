import 'package:flutter/material.dart';

class ViewCoursesScreen extends StatefulWidget {
  const ViewCoursesScreen({Key? key}) : super(key: key);

  @override
  State<ViewCoursesScreen> createState() => _ViewCoursesScreenState();
}

class _ViewCoursesScreenState extends State<ViewCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'View Courses',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              border: TableBorder.all(width: 1),
              children: const[
                TableRow(
                  children: [
                    Text(
                      'Courses',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Doctor',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Teaching Assistant',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Groups',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Edit',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
