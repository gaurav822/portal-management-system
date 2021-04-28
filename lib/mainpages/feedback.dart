import 'package:flutter/material.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
          Center(child: Text("This is Feedback",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}