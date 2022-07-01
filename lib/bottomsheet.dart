import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:notification/info.dart';
import 'package:notification/profile.dart';
import 'package:notification/remainder.dart';
import 'package:notification/globals.dart' as globals;

class BottomBarPage extends StatefulWidget {
  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  void initState() {
    super.initState();
    /* initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);*/
  }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  void onChangeTab(int index) {
    setState(() {
      globals.Selectedindex = index;
    });

    print("jhhcsdhvsdv" + index.toString());

    switch (globals.Selectedindex) {
      case 0:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Productinfomartion()));
        }
        break;
      case 1:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Expiryremainder()));
        }
        break;
      case 2:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profileinfo()));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return JumpingTabBar(
      onChangeTab: onChangeTab,
      backgroundColor: Colors.black12,
      circleGradient: LinearGradient(
        colors: [
          Colors.purpleAccent,
          Colors.deepPurple,
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      items: [
        TabItemIcon(
          iconData: Icons.info_outlined,
          curveColor: Colors.grey,
        ),
        TabItemIcon(
            iconData: Icons.notification_important_outlined,
            curveColor: Colors.orange),
        // TabItemIcon(iconData: Icons.location_on, curveColor: Colors.green),
        TabItemIcon(
            iconData: Icons.notification_important_outlined,
            curveColor: Colors.orange),
        // TabItemIcon(iconData: Icons.supervised_user_circle),
      ],
      selectedIndex: globals.Selectedindex,
    );
  }
}
