import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
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
              Text(_data),
              Container(
                child: Text(
                  _data,
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
