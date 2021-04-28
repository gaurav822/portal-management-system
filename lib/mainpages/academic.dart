import 'package:flutter/material.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
          Center(child: Text("This is Academic",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}