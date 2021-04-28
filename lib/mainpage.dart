import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<IconData> icon = [
    Icons.library_books,
    Icons.attach_money,
    Icons.create,
    Icons.apartment,
    Icons.directions_bus,
    Icons.feedback
  ];

  List sideItems = [
    {"icon": Icons.library_books, "name": "Academic"},
    {"icon": Icons.attach_money, "name": "Finance"},
    {"icon": Icons.create, "name": "Examination"},
    {"icon": Icons.apartment, "name": "Hostel"},
    {"icon": Icons.directions_bus, "name": "Transport"},
    {"icon": Icons.feedback, "name": "Feedback"},
  ];

  List<bool> selected = [false, false, false, false, false, false];

  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  Color blue = HexColor("#1b3154");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        actions: [
          CircleAvatar(),
          SizedBox(
            width: 6,
          ),
          Center(
            child: Text(
              "Gaurav Dahal",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {}),
          SizedBox(
            width: 7,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            // margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height,
            width: 80.0,
            decoration: BoxDecoration(
              color: blue,
              // borderRadius: BorderRadius.circular(20)),
            ),

            child: Stack(
              children: [
                Positioned(
                  top: 110,
                  child: Column(
                      children: List.generate(
                          sideItems.length,
                          (index) => NavBarItem(
                                icon: sideItems[index]["icon"],
                                name: sideItems[index]["name"],
                                selected: selected[index],
                                onTap: () {
                                  setState(() {
                                    select(index);
                                  });

                                },
                              ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final Function onTap;
  final bool selected;
  final String name;
  NavBarItem({this.icon, this.onTap, this.selected, this.name});
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(
        child: Container(
          width: 80,
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                child: Column(children: [
                  Center(
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}