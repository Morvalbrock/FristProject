import 'dart:async';
import 'dart:ffi';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'wecome_page_icons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom.dart';

class WelcomePage extends StatefulWidget {
  // const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  var userName;
  // late ConnectivityResult result;
  // late StreamSubscription subscription;
  // var isConnected = false;
  @override
  void initState() {
    // getStringValuesSF();
    super.initState();
    getValues();
    getConnectivity();
  }

  getValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('name');
    });

    // print(name);
    // return userName as String;
  }
  // getStringValuesSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return String
  //   prefs.setString('password', 'tEst');
  // }

  getConnectivity() =>
      //     subscription = Connectivity().onConnectivityChanged.listen(
      //       (ConnectivityResult result) async {
      //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
      //         if (!isDeviceConnected && isAlertSet == false) {
      //           showDialogBox();
      //           setState(() {
      //             isAlertSet = true;
      //           });
      //         }
      //       },
      //     );

      InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              break;
            case InternetConnectionStatus.disconnected:
              showDialogBox();
              setState(() {
                isAlertSet = true;
              });
          }
        },
      );
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKeysss = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeysss1 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeysss,
      appBar: CustomAppBar(_scaffoldKeysss1, 'Welcome Page'),
      drawer: CustomDrawer(context),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome ${userName.toString()}',
                style: TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30.0,
                // width: MediaQuery.of(context).size.width * 0.65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      color: HexColor('CEDCFF'),
                      // decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     borderRadius: BorderRadiusDirectional.circular(10.0)
                      //     // borderRadius: BorderRadius.circular(10),
                      //     ),
                      // decoration: ShapeDecoration(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(2)),
                      //   color: HexColor('CEDCFF'),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'CUSTOMERS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Wecome_page.lni_lni_users__1_,
                              size: 50, color: HexColor('404040')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '43000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      color: HexColor('CEDCFF'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'PAID CUSTOMERS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Wecome_page.wallet_money,
                              size: 50, color: HexColor('404040')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '43000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.20,
                      color: HexColor('CEDCFF'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'EXPECTED REVENUE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Wecome_page.la_money_bill,
                              size: 50, color: HexColor('404040')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '43000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      color: HexColor('CEDCFF'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'TOTAL REVENUE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(Wecome_page.game_icons_money_stack,
                              size: 50, color: HexColor('404040')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '43000',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(context, 1),
    );
  }

  showDialogBox() => showDialog<String>(
        context: context,
        builder: ((BuildContext context) => AlertDialog(
              title: Text('No Connecton'),
              content: Text('Please check your internet connectivity'),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'Cancel');
                    setState(() => isAlertSet = false);
                    isDeviceConnected =
                        await InternetConnectionChecker().hasConnection;
                    if (!isDeviceConnected) {
                      showDialogBox();
                      setState(() => isAlertSet = false);
                    }
                  },
                  child: Text('OK'),
                ),
              ],
            )),
      );
}
