import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
          Center(child: Text("This is Transport",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}