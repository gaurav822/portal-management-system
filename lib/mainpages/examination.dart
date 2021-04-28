import 'package:flutter/material.dart';

class Examination extends StatefulWidget {
  @override
  _ExaminationState createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
          Center(child: Text("This is Exam",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
