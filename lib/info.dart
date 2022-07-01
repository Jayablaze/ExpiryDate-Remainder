import 'dart:ui';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:notification/bottomsheet.dart';
import 'package:http/http.dart' as http;

class Productinfomartion extends StatefulWidget {
  const Productinfomartion({Key key}) : super(key: key);

  @override
  _ProductinfomartionState createState() => _ProductinfomartionState();
}

List dropdownItemList = [];

class _ProductinfomartionState extends State<Productinfomartion> {
  List<String> fruits = [
    'Book',
    'Medicinal Products',
    'Food Products',
  ];

  String _data = "";
  String data1 = "";
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
    print("adadda" + _data);
    _launchUrl(_data);
  }

  static final http.Client httpClient = http.Client();
  void _launchUrl(value) async {
    print("ghchgchg");
    final data = await httpClient.get(
      //Uri.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:' + value),
      Uri.parse('https://product.data1.p.rapidapi.com/lookup?upc=' + value),
    );
    print("sakjkdsajdasj" + data.body.toString());
    setState(() {
      data1 = data.body;
    });
    print("jzxnkjzxkjc" + data1.toString());
  }

  @override
  void initState() {
    dropdownItemList.clear();

    dropdownItemList.add(
      {
        'label': 'Book',
        // 'label': '${fruits[i]}',
        'value': 'Book',
        'icon': Container(
          key: UniqueKey(),
          height: 20,
          width: 20,
          child: Image(
            image: AssetImage("images/book.png"),
          ),
        ),
        'selectedIcon': Container(
          key: UniqueKey(),
          width: 20,
          height: 200,
        ),
      },
    );
    dropdownItemList.add(
      {
        'label': 'Medicinal Products',
        // 'label': '${fruits[i]}',
        'value': 'Medicinal Products',
        'icon': Container(
          key: UniqueKey(),
          height: 20,
          width: 20,
          child: Image(
            image: AssetImage("images/medicine.png"),
          ),
        ),
        'selectedIcon': Container(
          key: UniqueKey(),
          width: 20,
          height: 20,
        ),
      },
    );
    dropdownItemList.add(
      {
        'label': 'Food Products',
        // 'label': '${fruits[i]}',
        'value': 'Food Products',
        'icon': Container(
          key: UniqueKey(),
          height: 20,
          width: 20,
          child: Image(
            image: AssetImage("images/food.png"),
          ),
        ),
        'selectedIcon': Container(
          key: UniqueKey(),
          width: 20,
          height: 20,
        ),
      },
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productinfo"),
      ),
      body: Container(
          color: Colors.grey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: CoolDropdown(
                  dropdownHeight: 150,
                  dropdownList: dropdownItemList,
                  onChange: (selectedItem) {
                    print(selectedItem);
                  },
                  onOpen: (isOpen) {
                    print('$isOpen');
                  },
                  resultIcon: Container(
                    width: 10,
                    height: 10,
                  ),
                  // dropdownBD: BoxDecoration(
                  //     color: Colors.white, border: Border.all(width: 20)),
                ),
              ),
              ElevatedButton(
                child: Text("Scan Barcode"),
                onPressed: () => _scan(),
              ),
            ],
          )),
      bottomNavigationBar: BottomBarPage(),
    );
  }
}
