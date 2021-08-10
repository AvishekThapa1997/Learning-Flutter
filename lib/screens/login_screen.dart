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
  var _passwordHidden = true;
  var _textController = TextEditingController();

  void clearText() => _textController.clear();
  final _formKey = GlobalKey<FormState>();

  void _moveToHome() async {
    if (_formKey.currentState?.validate() == true) {
      setState(() {
        _changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoute.homeRoute);
      setState(() {
        _changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/hey.png",
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _name.isNotEmpty
                                    ? Colors.grey
                                    : Colors.transparent),
                            child: Icon(
                              Icons.clear,
                              color: _name.isNotEmpty
                                  ? Colors.white
                                  : Colors.transparent,
                              size: 20.0,
                            ),
                          ),
                          onPressed: () => clearText(),
                        ),
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      onChanged: (data) {
                        _name = data;
                        setState(() {});
                      },
                      controller: _textController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Username Cannot Be Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: _passwordHidden ? true : false,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordHidden
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () => {
                              setState(
                                  () => {_passwordHidden = !_passwordHidden})
                            },
                          ),
                          hintText: "Enter Password",
                          labelText: "Password"),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "Password Cannot Be Empty";
                        } else if (value!.length < 6) {
                          return "Password Should Contain minimum 6 characters";
                        } else {
                          return null;
                        }
                      },
                    )
                  ],
                ),
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
            Material(
                color: Theme.of(context).buttonColor,
                borderRadius: BorderRadius.circular(_changeButton ? 50 : 8),
                child: InkWell(
                    splashColor: Colors.red,
                    onTap: () => _moveToHome(),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 40,
                      width: _changeButton ? 50 : 150,
                      alignment: Alignment.center,
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
                    )))
          ],
        ),
      ),
    );
  }
}
