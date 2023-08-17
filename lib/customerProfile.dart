import 'dart:async';
import 'dart:convert';
import 'editingPage.dart';
import 'package:demoapp/editingPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom.dart';
import 'demo_bottombar_icons.dart';
import 'package:intl/intl.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key, required this.cusid});
  final int cusid;

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  DateTime? _selected;
  Map<String, dynamic> fetchedData = {
    'id': '',
    'comp_id': '',
    'name': '',
    'mobile': '',
    'email': '',
    'door_no': '',
    'street': '',
    'area': '',
    'locality': '',
    'pincode': '',
    'set_top_box': '',
    'field_staff': '',
    'subscription_amt': '',
    'status': '',
  };
  @override
  void initState() {
    super.initState();
    ApiCall();
    Timer(Duration(seconds: 2), () {
      print(fetchedData);
    });
  }

  Future<void> ApiCall() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var Id, comp_id, cus_id;
      Response response = await post(
          Uri.parse("https://searchsoft.in/cable/api/edit_customer"),
          body: {
            'id': prefs.getInt('id').toString(),
            'comp_id': prefs.getInt('comp_id').toString(),
            'cus_id': widget.cusid.toString(),
          });
      var resp = jsonDecode(response.body);
      if (resp['status'] == 'success') {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Save Successfully'),
          backgroundColor: Colors.greenAccent,
        ));
        setState(() {
          Id = prefs.getInt('id').toString();
          comp_id = prefs.getInt('comp_id').toString();
          cus_id = widget.cusid.toString();
          fetchedData['id'] = resp['data']['id'];
          fetchedData['comp_id'] = resp['data']['comp_id'];
          fetchedData['name'] = resp['data']['name'];
          fetchedData['mobile'] = resp['data']['mobile'];
          fetchedData['email'] = resp['data']['email'];
          fetchedData['door_no'] = resp['data']['door_no'];
          fetchedData['street'] = resp['data']['street'];
          fetchedData['area'] = resp['data']['area'];
          fetchedData['locality'] = resp['data']['locality'];
          fetchedData['pincode'] = resp['data']['pincode'];
          fetchedData['set_top_box'] = resp['data']['set_top_box'];
          fetchedData['field_staff'] = resp['data']['field_staff'];
          fetchedData['subscription_amt'] = resp['data']['subscription_amt'];
          fetchedData['status'] = resp['data']['status'];
          // fetchedData = resp['data'];
          print(' API - ' + fetchedData.toString());
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _selected ?? DateTime.now();
    return Scaffold(
      // key: _scaffoldKeys,
      backgroundColor: HexColor('ECEEF9'),
      appBar: CustomsAppBar(context, 'Customer Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 24.0,
              ),
              // alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14.0),
                    child: Container(
                      height: 280,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                    'Name:',
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    fetchedData['name'],
                                    style: TextStyle(
                                      color: Color(0xFF183BB7),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.10,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      heightFactor: 0.2,
                                      child: IconButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           EditingPage(
                                            //               cusid: fetchedData[
                                            //                   'id']),
                                            //     ));
                                            print('hai');
                                          },
                                          icon: Icon(
                                            Icons.edit_note_sharp,
                                            size: 25,
                                          )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                    'Mobile:',
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    fetchedData['mobile'],
                                    style: TextStyle(
                                      color: Color(0xFF183BB7),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                    'Setup\nbox Num:',
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    fetchedData['set_top_box'],
                                    style: TextStyle(
                                      color: Color(0xFF183BB7),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  child: Align(heightFactor: 0.6),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                    'Address:',
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    fetchedData["door_no"] +
                                        ',\n' +
                                        fetchedData["street"] +
                                        ',\n' +
                                        fetchedData["area"] +
                                        ',\n' +
                                        fetchedData["locality"] +
                                        ',\n ' +
                                        fetchedData["pincode"],
                                    style: TextStyle(
                                      color: Color(0xFF183BB7),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.02,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  child: Align(heightFactor: 0.6),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Text(
                                    'Status:',
                                    style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.01,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: ProfileStatus(fetchedData['status']),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.10,
                                  child: Align(heightFactor: 0.6),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 104,
                    height: 40.0,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MM/YYYY',
                          style: TextStyle(
                            color: Color(0xFF484848),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ActionChip(
                    labelPadding: EdgeInsets.only(left: 1.0),
                    avatar: Icon(
                      Icons.calendar_month_outlined,
                      size: 18.0,
                    ),
                    label: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.14,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_selected == null)
                            Text(DateFormat().add_yM().format(DateTime.now()))
                          else
                            Text(DateFormat().add_yM().format(_selected!)),
                          // TextButton(
                          //   child: const Text('DEFAULT LOCALE'),
                          //   onPressed: () => _onPressed(context: context),
                          // ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 6.0,
                    shadowColor: Colors.grey[60],
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 3.0, bottom: 3.0),
                    onPressed: () => _onPressed(context: context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 24.0, right: 14.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFDFD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        'Validity Upto',
                        style: TextStyle(
                          color: Color(0xFF656565),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.01,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64.0,
                    ),
                    Text(
                      '23/08/2023',
                      style: TextStyle(
                        color: Color(0xFF183BB7),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFDFD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28.0,
                      ),
                      child: Text(
                        'Setupbox Id',
                        style: TextStyle(
                          color: Color(0xFF656565),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.01,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 68.0,
                    ),
                    Text(
                      '13605763259',
                      style: TextStyle(
                        color: Color(0xFF183BB7),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFDFD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28.0,
                      ),
                      child: Text(
                        'Ammount Pending',
                        style: TextStyle(
                          color: Color(0xFF656565),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.01,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32.0,
                    ),
                    Text(
                      '₹0.00',
                      style: TextStyle(
                        color: Color(0xFF183BB7),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFDFD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28.0,
                      ),
                      child: Text(
                        'Billing Status',
                        style: TextStyle(
                          color: Color(0xFF656565),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.01,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 64.0,
                    ),
                    Text(
                      'PAID',
                      style: TextStyle(
                        color: Color(0xFF079915),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.01,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 5),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
