import 'package:flutter/material.dart';
import 'package:notification/bottomsheet.dart';

class Productinfo extends StatefulWidget {
  const Productinfo({Key key}) : super(key: key);

  @override
  _ProductinfoState createState() => _ProductinfoState();
}

class _ProductinfoState extends State<Productinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productinfo"),
      ),
      body: Container(color: Colors.yellow),
      bottomNavigationBar: BottomBarPage(),
    );
  }
}
