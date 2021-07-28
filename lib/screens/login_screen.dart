import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _name = '';
  var _changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_pic.png",
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              "Welcome $_name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    onChanged: (data) {
                      _name = data;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () => {
            //     Navigator.pushNamed(context, AppRoute.homeRoute)
            //     //Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
            //   },
            //   child: Text("Login"),
            //   style: TextButton.styleFrom(
            //       backgroundColor: Colors.blue, minimumSize: Size(150, 40)),
            // )
            InkWell(
                onTap: () {
                  setState(() {
                    _changeButton = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: 40,
                  onEnd: () => {
                    Navigator.pushNamed(context, AppRoute.homeRoute)
                  },
                  width: _changeButton ? 50 : 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: _changeButton ? BoxShape.circle : BoxShape
                      //     .rectangle,
                      borderRadius:
                          BorderRadius.circular(_changeButton ? 50 : 8)),
                  child: _changeButton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                ))
          ],
        ),
      ),
    );
  }
}
