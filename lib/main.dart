import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:notification/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Productinfomartion(),
    );
  }
}
