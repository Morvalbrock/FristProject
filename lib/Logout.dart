import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:duration_button/duration_button.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});
  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final GlobalKey<ScaffoldState> _scaffoldKeys = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    setpref();
  }

  setpref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Navigator.of(context).pushNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKeys,
        body: DurationButton(
          duration: const Duration(seconds: 10),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
          child: const Text(""),
        ));
  }
}
