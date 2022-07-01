import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expirydetector extends StatefulWidget {
  const Expirydetector({Key key}) : super(key: key);

  @override
  _ExpirydetectorState createState() => _ExpirydetectorState();
}

class _ExpirydetectorState extends State<Expirydetector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expiry Remainder"),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Scan Barcode"),
          onPressed: () {},
        ),
      ]),
    );
  }
}
