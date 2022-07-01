import 'package:flutter/material.dart';

import 'bottomsheet.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({Key key}) : super(key: key);

  @override
  _ProfileinfoState createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: Container(color: Colors.lightGreen),
      bottomNavigationBar: BottomBarPage(),
    );
  }
}
