import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Profile/profile_screen.dart';
import 'Tasks/home_screen.dart';
import 'Tasks/progress_screen.dart';
import 'Tasks/task_states_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30,color: Colors.white,),
            Icon(Icons.list, size: 30,color: Colors.white,),
            Icon(Icons.bar_chart, size: 30,color: Colors.white,),
            Icon(Icons.perm_identity, size: 30,color: Colors.white,),
          ],
          color: Color(0xfffe3e3f),
          buttonBackgroundColor: Color(0xfffe3e3f),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      body: <Widget>[
        HomeScreen(),
        TaskStatesScreen(),
        ProgressScreen(),
        ProfileScreen()
      ][_page],
    );
  }
}
