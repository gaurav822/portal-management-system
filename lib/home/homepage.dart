import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:student_portal/mainpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width * .4,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 5, offset: Offset(0.7, 0.7), color: Colors.grey)
              ]),
              child: Column(
                children: [
                  Expanded(
                    child: _header(),
                    flex: 1,
                  ),
                  Expanded(
                    child: _body(),
                    flex: 9,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _header() {
    Color color = new Color(0x484622);
    return Container(
      width: double.infinity,
      color: HexColor("#484622"),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "Student Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget _body() {
    Color theme = HexColor("#484622");
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Application Number / Register Number",
              style: TextStyle(
                  color: theme, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            _textField(
                hinttext: "Enter Application Number / Register Number",
                isObsecure: false),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password",
              style: TextStyle(
                  color: theme, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            _textField(hinttext: "Password", isObsecure: true),
            SizedBox(
              height: 15,
            ),
            Text(
              "Q8537",
              style: TextStyle(
                  color: theme, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            _textField(hinttext: "Enter Captcha text", isObsecure: false),
            SizedBox(
              height: 10,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: _gotoMainPage,
      minWidth: double.infinity,
      color: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      height: 50,
    );
  }

  _gotoMainPage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => MainPage()), (route) => false);
  }

  Widget _textField({String hinttext, bool isObsecure}) {
    OutlineInputBorder border = new OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.grey,
        ));

    OutlineInputBorder focusborder = new OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.blue,
        ));

    return TextField(
      cursorColor: Colors.black,
      cursorHeight: 20,
      obscureText: isObsecure,
      style: TextStyle(fontSize: 16, height: 1.0, color: Colors.black),
      decoration: InputDecoration(
          enabled: true,
          enabledBorder: border,
          focusedBorder: focusborder,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }
}
