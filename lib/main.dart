import 'package:demoapp/accountHistory.dart';
import 'package:demoapp/customerProfileEx.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Logout.dart';
import 'login.dart';
import 'customerPage.dart';
import 'wecome_page_icons.dart';
import 'welcomePage.dart';
import 'newCustomerInfo.dart';
import 'customerProfile.dart';
import 'profileSetting.dart';
import 'support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null)
      ? false
      : prefs.getBool('isLoggedIn');

  var pg = '/';
  if (isLoggedIn == true) {
    pg = 'home';
  } else {
    pg = '/';
  }
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: new MyApp(),
      initialRoute: pg,
      routes: {
        // '/': (context) => MyApp(),
        '/': (context) => Login(),
        'home': (context) => WelcomePage(),
        'search': (context) => CustomPage(),
        // 'search': (context) => CustomerProfile(),
        'addcustomer': (context) => NewCustomer(),
        // 'customerprofile': (context) => CustomerProfile(),
        'profile': (context) => ProfileSetting(),
        'logout': (context) => Logout(),
        'support': (context) => Supportfile(),
        // 'support': (context) => CustomerProfile(),
        // 'support': (context) => CustomerProfileEx(),
        // 'support': (context) => AccountHistory(),
      },
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    ),
  );
}
