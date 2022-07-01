import 'package:flutter/material.dart';

import 'addexpiry.dart';
import 'bottomsheet.dart';

class Expiryremainder extends StatefulWidget {
  const Expiryremainder({Key key}) : super(key: key);

  @override
  _ExpiryremainderState createState() => _ExpiryremainderState();
}

class _ExpiryremainderState extends State<Expiryremainder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expiry Remainder"),
      ),
      body: Container(color: Colors.orange),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Expirydetector()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomBarPage(),
    );
  }
}
