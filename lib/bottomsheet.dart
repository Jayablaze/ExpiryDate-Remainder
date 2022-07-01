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
  void onChangeTab(int index) {
    setState(() {
      globals.Selectedindex = index;
    });

    print("jhhcsdhvsdv" + index.toString());

    switch (globals.Selectedindex) {
      case 1:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Productinfomartion()));
        }
        break;
      case 2:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Expiryremainder()));
        }
        break;
      case 3:
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
          buildWidget: (_, color) => Stack(
            children: <Widget>[
              new Icon(
                Icons.perm_identity_rounded,
                size: 30,
              ),
              new Positioned(
                top: 1.0,
                right: 0.0,
                child: new Stack(
                  children: <Widget>[
                    new Icon(
                      Icons.brightness_1,
                      size: 18.0,
                      color: Colors.green[800],
                    ),
                    new Positioned(
                      top: 1.0,
                      right: 4.0,
                      child: new Text("2",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
          curveColor: Colors.lightGreen,
        ),
        // TabItemIcon(iconData: Icons.supervised_user_circle),
      ],
      selectedIndex: globals.Selectedindex,
    );
  }
}
