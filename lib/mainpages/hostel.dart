import 'package:flutter/material.dart';

class Hostel extends StatefulWidget {
  @override
  _HostelState createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
          Center(child: Text("This is Hostel",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}