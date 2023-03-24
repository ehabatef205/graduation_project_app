import 'package:flutter/material.dart';

class GetIdScreen extends StatefulWidget {
  const GetIdScreen({Key? key}) : super(key: key);

  @override
  State<GetIdScreen> createState() => _GetIdScreenState();
}

class _GetIdScreenState extends State<GetIdScreen> {
  var national_ID = TextEditingController();
  var high_School_Degree = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Get ID',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: national_ID,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelText: 'National ID',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.account_box_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: high_School_Degree,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelText: 'High School Degree',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.account_box_outlined,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: MaterialButton(
                onPressed: () {
                  print(national_ID.text);
                  print(high_School_Degree.text);
                },
                color: Colors.black87,
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
          ],
        ),
      ),
    );
  }
}
