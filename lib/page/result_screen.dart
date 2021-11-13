import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner/page/home.dart';
import 'package:qr_scanner/page/scaning_screen.dart';

class ResutlScreen extends StatefulWidget {
  final String data;

  const ResutlScreen({Key? key, required this.data}) : super(key: key);

  @override
  _ResutlScreenState createState() => _ResutlScreenState();
}

class _ResutlScreenState extends State<ResutlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Details"),
        leading: IconButton(
            onPressed: () {
              Get.offAll(HomePage());
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text("Data : ${widget.data}"),
        ),
      ),
    );
  }
}
