import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/update_data_courses/update_data_courses_screen.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              border: TableBorder.all(width: 1),
              children: [
                const TableRow(
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
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(
                                    courseName: "AAA",
                                    doctor: "BBB",
                                    teachingAssistant: "CCC",
                                    groups: 2,
                                  )),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text(
                      'M 494',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Nour ElHoda',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'none',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '3',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataCoursesScreen(courseName: "AAA",
                                doctor: "BBB",
                                teachingAssistant: "CCC",
                                groups: 2,)),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
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
