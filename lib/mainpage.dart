import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'mainpages/academic.dart';
import 'mainpages/examination.dart';
import 'mainpages/finance.dart';
import 'mainpages/hostel.dart';
import 'mainpages/transport.dart';
import 'mainpages/feedback.dart';

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

  List mainPages = [
    Academic(),
    Finance(),
    Examination(),
    Hostel(),
    Transport(),
    Feedbacks()
  ];

  List first = [
      "Student Name",
      "Register Number",
      "Academic year",
      "Institution",
          "Semester",
      "Program/Section",
      "DOB/Gender",
      "Father/Mother Name"
    ];
    List second = [
      "Gaurav Dahal",
      "AP17110010128",
      "2017-2021",
      "SEAS",
      "8th",
      "B.Tech CSE/ CSE-B",
      "1998-02-02/M",
      "Tilak Kumar Dahal"
    ];

  List<bool> selected = [false, false, false, false, false, false];

  void select(int n) {
    for (int i = 0; i <= 5; i++) {
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
              child: selected.indexOf(true) != -1
                  ? mainPages[selected.indexOf(true)]
                  : _defaultProfile()),
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
                                color: selected[index] == true
                                    ? "#3b5b8f"
                                    : "#1b3154",
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

  Widget _defaultProfile() {
    

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: Text(
              "PROFILE",
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 100, right: 20, top: 30),
            width: double.infinity,
            // height: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(children: [
                Expanded(
                  
                  child: Container(
                    
                    child: firstRow()),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    
                    child: secondRow()),
                  flex: 1,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget firstRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i=0;i<first.length;i++) Container(
          height: 50,
          child: Text(first[i],style: TextStyle(color: blue, fontSize: 13),))
      ],
    );
  }

  Widget secondRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i=0;i<second.length;i++) Container(
          height: 50,
                  child: Column(
                                      children: [Text(second[i], style: TextStyle(
                    color: blue, fontSize: 16, fontWeight: FontWeight.bold),),
                    ]
                  ),
        ),
        
      ],
    );
  }

  Widget _eachRow(String first, String second) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            first,
            style: TextStyle(color: blue, fontSize: 13),
          ),
          SizedBox(
            width: 70,
          ),
          Text(
            second,
            style: TextStyle(
                color: blue, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Divider(
        color: blue,
        thickness: 0.4,
      )
    ]);
  }
}

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final Function onTap;
  final bool selected;
  final String name;
  final String color;
  NavBarItem({this.icon, this.onTap, this.selected, this.name, this.color});
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  Color boxColor = HexColor("#1b3154");
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
                margin: EdgeInsets.only(top: 10),
                height: 60,
                width: 80,
                decoration: BoxDecoration(
                  color: HexColor(widget.color),
                ),
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
