import 'package:flutter/material.dart';

class CollegeDepartments extends StatelessWidget {
  final String image;
  final String titleAppbar;
  final String description;
  CollegeDepartments({
    required this.image,
    required this.description,
    required this.titleAppbar,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          titleAppbar,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    height: size.height * 0.3,
                    width: size.width * 0.3,
                  ),
                ),
                Text(
                  description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}