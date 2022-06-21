import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //final String title;

  @override
  State<MyHomePage> createState() => _QrCodeState();
}

class _QrCodeState extends State<MyHomePage> {
  String _data = "";
  String data1 = '';
  final Uri _url = Uri.parse('https://WWW.google.com/search?q=');
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
    _launchUrl(_data);
  }

  static final http.Client httpClient = http.Client();
  void _launchUrl(value) async {
    print("ghchgchg");
    final data = await httpClient.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:' + value),
    );

    print("sakjkdsajdasj" + data.body.toString());
    setState(() {
      data1 = data.body;
    });
    print("jzxnkjzxkjc" + data.reasonPhrase.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: 500,
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Scan Barcode"),
                onPressed: () => _scan(),
              ),
              Container(
                child: Text(
                  _data,
                ),
              ),
              Container(
                child: Text(
                  data1,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
