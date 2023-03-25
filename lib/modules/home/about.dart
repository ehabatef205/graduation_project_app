import 'package:flutter/material.dart';

class aboutScreen extends StatelessWidget {
  const aboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'About',
          style: TextStyle(
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
              children: const [
                Text(
                  "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food."
                      "Most of us just jam randomly on the keyboard,"
                      " into the textboxes or textareas just to get the real"
                      " feeling of how text would look like in a web page."
                      " Although this way works, it just doesn’t feel right!"
                      " Creating a text on-the-fly just consumes too much time"
                      " and brain food.",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
