import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/update_data_student/update_data_student.dart';

class ViewStudentScreen extends StatefulWidget {
  const ViewStudentScreen({Key? key}) : super(key: key);

  @override
  State<ViewStudentScreen> createState() => _ViewStudentScreenState();
}

class _ViewStudentScreenState extends State<ViewStudentScreen> {
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
                      'Student Name',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Student ID',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'GPA',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Edit',
                      textAlign: TextAlign.center,
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Text(
                      'Abdallah Salama Abdallah',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '1827060',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '1.5',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataStudentScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Text(
                      'Abdallah Salama Abdallah',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '1827060',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '1.5',
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdateDataStudentScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ]
                ),
                TableRow(
                    children: [
                      Text(
                        'Abdallah Salama Abdallah',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1827060',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1.5',
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateDataStudentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Text(
                        'Abdallah Salama Abdallah',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1827060',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1.5',
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateDataStudentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Text(
                        'Abdallah Salama Abdallah',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1827060',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1.5',
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateDataStudentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Text(
                        'Abdallah Salama Abdallah',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1827060',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1.5',
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateDataStudentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Text(
                        'Abdallah Salama Abdallah',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1827060',
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '1.5',
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateDataStudentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
