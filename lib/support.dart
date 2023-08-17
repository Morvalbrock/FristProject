import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:hexcolor/hexcolor.dart';

import 'custom.dart';

class Supportfile extends StatefulWidget {
  const Supportfile({super.key});

  @override
  State<Supportfile> createState() => _SupportfileState();
}

class _SupportfileState extends State<Supportfile> {
  final GlobalKey<ScaffoldState> _scaffoldKeys2 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeys22 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('ECEEF9'),
      key: _scaffoldKeys2,
      appBar: CustomAppBar(_scaffoldKeys22, 'Support Page'),
      drawer: CustomDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                top: 24.0,
              ),
              child: Text(
                'Having any issues Don’t worry.Here some\n FAQ’s of our service',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.01,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 12, top: 26.0),
              child: Text(
                'FAQ’s',
                style: TextStyle(
                  color: Color(0xFF242323),
                  fontSize: 18,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.02,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'Can i request for a different mechanic?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'How do i change tha oil in my vehicle?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'Can i change or cancel my appointment?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'How do i pay for the service?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'Can i able to pay after the service?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'How often should i have my brake checked?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GFAccordion(
                title: 'How do i know if my car service is completed?',
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
                        child: Text(
                            'Yes  you can pay after the service .\nThis option is available in the payment screen.\nIt make you covenience we think so..')),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 3),
    );
  }
}
