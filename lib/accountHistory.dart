import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'custom.dart';

class AccountHistory extends StatefulWidget {
  const AccountHistory({super.key});

  @override
  State<AccountHistory> createState() => _AccountHistoryState();
}

class _AccountHistoryState extends State<AccountHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomsAppBar(context, 'Account History'),
      backgroundColor: HexColor('ECEEF9'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Praveen kumar',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      ' —₹1000',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Thivin kanth',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      '₹1000',
                      style: TextStyle(
                        color: Color(0xFF2AB74A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Agilan',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      '₹1000',
                      style: TextStyle(
                        color: Color(0xFF2AB74A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Praveen Devan',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      '₹1000',
                      style: TextStyle(
                        color: Color(0xFF2AB74A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Abishek',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      '₹1000',
                      style: TextStyle(
                        color: Color(0xFF2AB74A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 380,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.800000011920929),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 8.0),
                        child: Text(
                          'Kamalakannan',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0, top: 5.0),
                        child: Text(
                          '14/3/ 2023',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 22.0,
                    ),
                    child: Text(
                      '—₹1000',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.01,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
