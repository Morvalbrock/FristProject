import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'custom.dart';
import 'demo_bottombar_icons.dart';
import 'package:intl/intl.dart';

class CustomerProfileEx extends StatefulWidget {
  const CustomerProfileEx({super.key});

  @override
  State<CustomerProfileEx> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfileEx> {
  DateTime? _selected;
  // final GlobalKey<ScaffoldState> _scaffoldKeys = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> _scaffoldKeyss = GlobalKey<ScaffoldState>();
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
                top: 15.0,
              ),
              // alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14, right: 14.0),
                    child: Container(
                      height: 260,
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
                                    'Customer Name',
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
                                          onPressed: () {},
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
                                    '9988774455',
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
                                    '13605763259',
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
                                    '13/9,\n Gandhi nagar,\n Pudhusampalli,\n Mettur,\n Salem DT',
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
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle_sharp,
                                        size: 10.0,
                                        color: Color(0xFFB6B7BA),
                                      ),
                                      Text(
                                        'Active',
                                        style: TextStyle(
                                          color: Color(0xFFB6B7BA),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.01,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Icon(
                                        Icons.circle_sharp,
                                        size: 10.0,
                                        color: Color(0xFFF51313),
                                      ),
                                      Text(
                                        'In Active',
                                        style: TextStyle(
                                          color: Color(0xFFF51313),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.01,
                                        ),
                                      ),
                                    ],
                                  ),
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
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 8.0),
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
                                  Text(DateFormat()
                                      .add_yM()
                                      .format(DateTime.now()))
                                else
                                  Text(
                                      DateFormat().add_yM().format(_selected!)),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 15.0, right: 14.0),
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
                      'UNPAID',
                      style: TextStyle(
                        color: Colors.grey,
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
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 120.0,
              height: 36.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B3195)),
                child: Text(
                  'PAYNOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.01,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Pay on Advance',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    letterSpacing: 0.01,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 1),
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
