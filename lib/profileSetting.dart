import 'dart:async';
import 'dart:convert';
import 'package:demoapp/login.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart';
import 'custom.dart';
import 'demo_bottombar_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

final TextEditingController namecontroller = TextEditingController();
final TextEditingController mobilecontroller = TextEditingController();

final TextEditingController oldpassword = TextEditingController();
final TextEditingController newpassword = TextEditingController();

class _ProfileSettingState extends State<ProfileSetting> {
  var userName, userMobile, userId, userCompid;
  dynamic sms = true;

  @override
  void initState() {
    // getStringValuesSF();
    super.initState();
    getValues();
  }

  getValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('name');
      userMobile = prefs.getString('mobile');
      userId = prefs.getInt('id');
      userCompid = prefs.getInt('comp_id');
      namecontroller.text = userName;
      mobilecontroller.text = userMobile.toString();

      if (prefs.getString('sms') == 'true') {
        sms = true;
      } else {
        sms = false;
      }
      print(sms);
    });

    // print(name);
    // return userName as String;
  }

  @override
  void dispose() {
    namecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('ECEEF9'),
      body: Container(
        // padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.0, left: 20.0, bottom: 18.0),
                child: Text(
                  'PROFILE SETTINGS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: CircleAvatar(
                        radius: 42.0,
                        backgroundColor: HexColor('789BF6'),
                        child: Text(
                          'PK',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.03,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'Hi! $userName',
                        style: TextStyle(
                          color: Color(0xFF0B3195),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.02,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: GFAccordion(
                      title: 'Change Name',
                      textStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.01,
                      ),
                      contentChild: Column(
                        children: [
                          SizedBox(
                            height: 6.0,
                          ),
                          TxtFld(namecontroller, 'Enter name here'),
                          SizedBox(
                            height: 10.0,
                          ),
                          GFButton(
                            color: HexColor('789BF6'),
                            text: "Save",
                            textStyle: TextStyle(color: Colors.white),
                            onPressed: () async {
                              Map<String, dynamic> array = {
                                'id': userId.toString(),
                                'comp_id': userCompid.toString(),
                                'name': namecontroller.text,
                              };
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                prefs.setString('name', namecontroller.text);
                              });
                              var response = ApiCall(array,
                                  "https://searchsoft.in/cable/api/profile_update/name");
                              Timer(Duration(seconds: 3), () {
                                Navigator.of(context).pushNamed("profile");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GFAccordion(
                      title: 'Change  Password',
                      textStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.01,
                      ),
                      contentChild: Column(
                        children: [
                          SizedBox(
                            height: 6.0,
                          ),
                          SizedBox(
                            height: 148.0,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40.0,
                                  child: TextField(
                                    controller: oldpassword,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Old Password',
                                        hintStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 40.0,
                                  child: TextField(
                                    controller: newpassword,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter New Password',
                                        hintStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GFButton(
                                  color: HexColor('789BF6'),
                                  text: "Update",
                                  textStyle: TextStyle(color: Colors.white),
                                  onPressed: () async {
                                    Map<String, dynamic> array = {
                                      'id': userId.toString(),
                                      'comp_id': userCompid.toString(),
                                      'oldpassword': oldpassword.text,
                                      'password': newpassword.text,
                                    };
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    // setState(() {
                                    //   prefs.setString(
                                    //       'password', passwordcontroller.text);
                                    // });
                                    var response = ApiCall(array,
                                        "https://searchsoft.in/cable/api/profile_update/password");
                                    // Timer(Duration(seconds: 3), () {
                                    //   Navigator.of(context)
                                    //       .pushNamed("profile");
                                    // });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GFAccordion(
                      title: 'Change  Mobille number',
                      textStyle: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.01,
                      ),
                      contentChild: Column(
                        children: [
                          SizedBox(
                            height: 6.0,
                          ),
                          TxtFld(mobilecontroller, 'Enter mobile number here'),
                          SizedBox(
                            height: 10.0,
                          ),
                          GFButton(
                            color: HexColor('789BF6'),
                            onPressed: () async {
                              Map<String, dynamic> array = {
                                'id': userId.toString(),
                                'comp_id': userCompid.toString(),
                                'mobile': mobilecontroller.text,
                              };
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                prefs.setString(
                                    'mobile', mobilecontroller.text);
                              });
                              var response = ApiCall(array,
                                  "https://searchsoft.in/cable/api/profile_update/mobile");
                              Timer(Duration(seconds: 3), () {
                                Navigator.of(context).pushNamed("profile");
                              });
                            },
                            text: "Save",
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 10, right: 12),
                    child: Container(
                      height: 45.0,
                      color: Colors.white,
                      alignment: Alignment.centerRight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.sms_outlined),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, right: 20.0),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: 10.0, right: 80.0),
                              child: Text(
                                'SMS Notification',
                                style: TextStyle(
                                  color: Color(0xFF2B2B2B),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.01,
                                ),
                              ),
                            ),
                          ),
                          GFToggle(
                            onChanged: (val) async {
                              Map<String, dynamic> array = {
                                'id': userId.toString(),
                                'comp_id': userCompid.toString(),
                                'sms': val.toString(),
                              };
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                var smstxt;
                                if (val == true) {
                                  smstxt = 'true';
                                } else {
                                  smstxt = 'false';
                                }
                                prefs.setString('sms', smstxt);
                              });
                              var response = ApiCall(array,
                                  "https://searchsoft.in/cable/api/profile_update/sms");
                              // ignore: avoid_print
                              // print(response.toString());
                            },
                            value: sms ?? false,
                            type: GFToggleType.ios,
                            enabledTrackColor: HexColor('0B3195'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: SizedBox(
                      width: 160.0,
                      height: 40.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(HexColor('0B3195')),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("logout");
                        },
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                            color: HexColor('FFFFFF'),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 4),
    );
  }

  void ApiCall(params, Url) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await post(Uri.parse(Url), body: params);
      var resp = jsonDecode(response.body);
      if (resp['status'] == 'success') {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(resp['message']),
          backgroundColor: Colors.blueGrey,
        ));
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
