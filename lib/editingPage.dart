import 'dart:async';
import 'dart:convert';

import 'package:demoapp/profileSetting.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_bottombar_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'custom.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({super.key, required cusid});

  @override
  State<EditingPage> createState() => _NewCustomerState();
}

final GlobalKey<FlutterPwValidatorState> validatorKey =
    GlobalKey<FlutterPwValidatorState>();
final TextEditingController cusnamecontroller = TextEditingController();
final TextEditingController cusmobilecontroller = TextEditingController();

final TextEditingController cusdoornumber = TextEditingController();
final TextEditingController cusstreetname = TextEditingController();

final TextEditingController cuslocation = TextEditingController();
final TextEditingController setboxnumber = TextEditingController();
bool _validate = false;

class _NewCustomerState extends State<EditingPage> {
  final formKey = GlobalKey<FormState>();
  var cusName,
      cusMobile,
      Id,
      cusCompid,
      doornumber,
      streetName,
      Location,
      staffid,
      setupboxnum;
  List data = [];
  int _value = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final res = await http.post(
          Uri.parse(
            'https://searchsoft.in/cable/api/staff_list',
          ),
          body: {
            'id': prefs.getInt('id').toString(),
            'comp_id': prefs.getInt('comp_id').toString()
          });
      var json_data = jsonDecode(res.body);

      // print(json_data);
      setState(() {
        data = json_data['data'];
        var id = prefs.getInt('id');
        _value = id!;
        Id = id;
        cusCompid = prefs.getInt('comp_id').toString();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF1F4FF),
      backgroundColor: HexColor('ECEEF9'),
      appBar: CustomsAppBar(context, 'CustomerInfo'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            // height: 40.0,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              validator: validateName,
                              controller: cusnamecontroller,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_2_outlined,
                                  size: 20.0,
                                ),

                                hintText: 'Enter your name here',

                                hintStyle: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.01,
                                ),
                                // contentPadding: EdgeInsets.symmetric(
                                //     vertical: 10, horizontal: 20.0),
                                errorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 0.0, bottom: 0.0),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Mobile Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: cusmobilecontroller,
                              validator: validateMobile,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  size: 20.0,
                                ),
                                hintText: 'Enter your  mobile number',
                                hintStyle: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.01,
                                ),
                                errorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 0.0, bottom: 0.0),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              ' Add Address',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Door No',
                                  style: TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 14,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.01,
                                  ),
                                ),
                              ),
                              Container(
                                child: TextFormField(
                                  validator: validatedoornumber,
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: cusdoornumber,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.push_pin,
                                      size: 20.0,
                                    ),
                                    hintText: 'Enter your door number',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF616161),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                    errorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 0.0, bottom: 0.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Street Name',
                                  style: TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 14,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.01,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: TextFormField(
                                  validator: validatestreetname,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.streetAddress,
                                  controller: cusstreetname,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.push_pin,
                                      size: 20.0,
                                    ),
                                    hintText: 'Enter your Street',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF616161),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                    errorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 0.0, bottom: 0.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Locality',
                                  style: TextStyle(
                                    color: Color(0xFF1E1E1E),
                                    fontSize: 14,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.01,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: TextFormField(
                                  validator: validatelocation,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.streetAddress,
                                  controller: cuslocation,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.push_pin,
                                      size: 20.0,
                                    ),
                                    hintText: 'Enter your  location',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF616161),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                    errorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 0.0, bottom: 0.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Setupbox Number',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              validator: validatesetupbox,
                              controller: setboxnumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.network_check_rounded,
                                  size: 20.0,
                                ),
                                hintText: 'Enter your  setupbox number',
                                hintStyle: TextStyle(
                                  color: Color(0xFF616161),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.01,
                                ),
                                errorBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 0.0, bottom: 0.0),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            height: 50.0,
                            color: Colors.white,
                            child: Container(
                              width: double.infinity,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50.0,
                                child: DropdownButtonHideUnderline(
                                  child: GFDropdown(
                                    borderRadius: BorderRadius.circular(5),
                                    border: const BorderSide(
                                        color: Colors.black12, width: 1),
                                    dropdownButtonColor: Colors.white,
                                    value: _value,
                                    onChanged: (v) {
                                      setState(() {
                                        _value = v as int;
                                        staffid = _value;
                                      });
                                    },
                                    items: data.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(e["name"]),
                                        value: e['id'],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GFButton(
                            onPressed: () {
                              setState(() {
                                cusnamecontroller.text = "";
                                cusmobilecontroller.text = "";
                                cusdoornumber.text = "";
                                cusstreetname.text = "";
                                cuslocation.text = "";
                                setboxnumber.text = "";
                              });
                            },
                            text: "Clear",
                            textStyle:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            type: GFButtonType.outline,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          GFButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }

                              Map<String, dynamic> array = {
                                'id': Id.toString(),
                                'comp_id': cusCompid.toString(),
                                'name': cusnamecontroller.text,
                                'mobile': cusmobilecontroller.text,
                                'door_no': cusdoornumber.text,
                                'street': cusstreetname.text,
                                'area': cuslocation.text,
                                'set_top_box': setboxnumber.text,
                                'field_staff': _value.toString(),
                              };

                              var response = ApiCall(array,
                                  "https://searchsoft.in/cable/api/add_customer");
                              print(array);
                            },
                            text: "Save",
                            textStyle: TextStyle(fontSize: 16.0),
                            color: Color(0xFF0B3195),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 1),
    );
  }

  String? validateMobile(String? value) {
    if (value!.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String? validatesetupbox(String? value) {
    if (value!.length != 10)
      return 'Enter must be a setupbox number ';
    else
      return null;
  }

  String? validateName(String? value) {
    if (value!.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String? validatelocation(String? value) {
    if (value!.length < 3)
      return 'Enter must be a Area';
    else
      return null;
  }

  String? validatestreetname(String? value) {
    if (value!.length < 3)
      return 'Enter must be a street name';
    else
      return null;
  }

  String? validatedoornumber(String? value) {
    if (value!.length < 3)
      return 'Enter must be a door number';
    else
      return null;
  }

  void ApiCall(params, Url) async {
    try {
      Response response = await post(Uri.parse(Url), body: params);
      var resp = jsonDecode(response.body);
      if (resp['status'] == 'success') {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Save Successfully'),
          backgroundColor: Colors.greenAccent,
        ));
      }
      //  else {
      //   Navigator.pop(context);
      // }
    } catch (e) {
      print(e.toString());
    }
  }
}
