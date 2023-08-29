import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'demo_bottombar_icons.dart';
import 'package:getwidget/getwidget.dart';

Widget BottomNavBar(context, index) {
  return SizedBox(
    // height: 50.0,
    child: BottomNavigationBar(
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: HexColor('#05769A'),
      unselectedItemColor: Colors.black.withOpacity(.60),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'home',
                );
              },
              icon: Icon(
                Demo_bottombar.home,
                size: 20.0,
              ),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'search',
                );
              },
              icon: Icon(
                Demo_bottombar.magnifer,
                size: 20.0,
              ),
            ),
            label: "Search"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'support',
                );
              },
              icon: Icon(
                Demo_bottombar.group,
                size: 20.0,
              ),
            ),
            label: "Support"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'profile',
                );
              },
              icon: Icon(
                Demo_bottombar.user_rounded,
                size: 20.0,
              ),
            ),
            label: "Profile"),
      ],
    ),
  );
}

Widget CustomDrawer(context) {
  return Drawer(
    elevation: 12.0,
    width: 220.0,
    child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: HexColor('789BF6'),
                child: Text(
                  'PK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.03,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Praveen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
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
          height: 40.0,
          child: ListTile(
            onLongPress: () {
              Navigator.pushNamed(
                context,
                'home',
              );
            },
            leading: Icon(
              Demo_bottombar.home,
              size: 21.0,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Color(0xFF777777),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 40.0,
          child: ListTile(
            onLongPress: () {
              Navigator.pushNamed(
                context,
                'search',
              );
            },
            leading: Icon(
              Demo_bottombar.magnifer,
              size: 21.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Seach',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 40.0,
          child: ListTile(
            onLongPress: () {
              Navigator.pushNamed(
                context,
                'support',
              );
            },
            leading: Icon(
              Demo_bottombar.group,
              size: 21.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Support',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 40.0,
          child: ListTile(
            onLongPress: () {
              Navigator.pushNamed(
                context,
                'profile',
              );
            },
            leading: Icon(
              Demo_bottombar.user_rounded,
              size: 21.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 40.0,
          child: ListTile(
            leading: Icon(
              Icons.logout_outlined,
              size: 21.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    ),
  );
}

PreferredSize CustomAppBar(keys, String bartitle) {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      key: keys,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        bartitle,
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
          onPressed: () {
            keys.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          )),
    ),
  );
}

PreferredSize CustomsAppBar(context, bartitle) {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        bartitle,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      leading: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              weight: 26.0,
              size: 26.0,
              color: Color(0xFF1C274C),
            )),
      ),
    ),
  );
}

Widget TxtFld(_controller, String hint) {
  return SizedBox(
    height: 40.0,
    child: TextField(
      controller: _controller,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter name hear',
          hintStyle: TextStyle(fontSize: 14)),
    ),
  );
}

Widget ProfileStatus(status) {
  dynamic clr, txt;
  if (status == 1) {
    clr = Color(0xFF079915);
    txt = 'Active';
  } else {
    clr = Color(0xFFED0808);
    txt = 'In Active';
  }

  return Row(children: [
    Icon(
      Icons.circle_sharp,
      size: 10.0,
      color: clr,
    ),
    Text(
      txt,
      style: TextStyle(
        color: clr,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        letterSpacing: 0.01,
      ),
    )
  ]);
}
