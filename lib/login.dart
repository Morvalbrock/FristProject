import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

void login(String email, String password, context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    Response response =
        await post(Uri.parse('https://searchsoft.in/cable/api/login'), body: {
      'username': email,
      'password': password,
    });
    var resp = jsonDecode(response.body);
    if (resp['status'] == 'success') {
      prefs.setBool('isLoggedIn', true);
      // print(resp['data']['name']);
      prefs.setInt('id', resp['data']['id']);
      prefs.setString('name', resp['data']['name']);
      prefs.setString('username', resp['data']['username']);
      prefs.setString('email', resp['data']['email']);
      prefs.setInt('comp_id', resp['data']['comp_id']);
      prefs.setString('mobile', resp['data']['mobile']);
      prefs.setString('sms', resp['data']['is_sms']);

      // print(resp['mobile']);
      // prefs.setStringList('userdata', resp['data'][0]);
      Fluttertoast.showToast(
          msg: resp['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).pushNamed("home");
    } else {
      prefs.setBool('isLoggedIn', false);
      Fluttertoast.showToast(
          msg: resp['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).pushNamed("/");
    }
  } catch (e) {
    print(e.toString());
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 370.0,
                  height: 400.0,
                  child: Card(
                      margin: EdgeInsets.all(10.0),
                      elevation: 50,
                      shadowColor: Colors.black,
                      color: HexColor('#FFFFFF'),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 100.0, bottom: 80.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.0,
                              width: 300.0,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    prefixIcon: Icon(Icons.mail_outlined),
                                    // labelText: 'Enter Name',
                                    fillColor: HexColor('#EDEDED'),
                                    hintText: 'Username /email'),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              height: 50.0,
                              width: 300.0,
                              child: TextField(
                                controller: passwordcontroller,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    prefixIcon: Icon(Icons.key),
                                    // labelText: 'Enter Name',
                                    fillColor: HexColor('#EDEDED'),
                                    hintText: 'Password'),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () => login(
                            //       emailcontroller.text.toString(),
                            //       passwordcontroller.text.toString()),
                            // ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 240.0,
                              height: 48.0,
                              child: GFButton(
                                onPressed: () {
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   'home',
                                  // );
                                  login(emailcontroller.text,
                                      passwordcontroller.text, context);
                                },
                                text: "LOGIN",
                                textStyle: TextStyle(fontSize: 16.0),
                                shape: GFButtonShape.pills,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              )),
            ],
          )),
    );
  }
}
