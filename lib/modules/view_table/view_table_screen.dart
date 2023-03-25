import 'package:flutter/material.dart';

class ViewTableScreen extends StatefulWidget {
  const ViewTableScreen({Key? key}) : super(key: key);

  @override
  State<ViewTableScreen> createState() => _ViewTableScreenState();
}

class _ViewTableScreenState extends State<ViewTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Material Schedule',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              border: TableBorder.all(width: 1),
              children: const [
                TableRow(
                  children: [
                    Text(
                      "Course code",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Course type",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Group",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Day",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "From",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "To",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Place",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "M 494",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Sat",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "10:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "12:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "5",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Comp 427",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Sat",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "12:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "02:00",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "17",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Comp 490",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Sat",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "06:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "08:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "D",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Comp 402",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "2",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Mon",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "02:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "04:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "17",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "M 212",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "4",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tues",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "08:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "11:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "10",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Comp 427",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "LA",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Tues",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "11:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "02:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L 3",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "M 494",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "S",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Wed",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "10:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "12:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "17",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "Comp 402",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "LA",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "2",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Thurs",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "11:00 AM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "02:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "L 3",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Text(
                      "M 212",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "S",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "4",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Thurs",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "03:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "06:00 PM",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "17",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
