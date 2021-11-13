import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'result_screen.dart';

class ScaningScreen extends StatefulWidget {
  const ScaningScreen({Key? key}) : super(key: key);

  @override
  _ScaningScreenState createState() => _ScaningScreenState();
}

class _ScaningScreenState extends State<ScaningScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void reassemble() async {
    print("Checking Platform");
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    print("init");
  }

  @override
  void dispose() {
    controller?.dispose();
    controller!.stopCamera();
    print("Disposeed:::::::::::>>>>>>>>>>>>>>>>");
    controller!.resumeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[buildQrView(context)],
          ),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) => setState(() async {
          await controller.pauseCamera();
          Get.to(
              ResutlScreen(
                data: barcode.code.toString(),
              ),
              transition: Transition.zoom);
          // await Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //         builder: (_) => ResutlScreen(
          //               data: barcode.code.toString(),
          //             )),
          //     (route) => false);

          // await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => ResutlScreen(
          //             data: barcode.code.toString(),
          //           )),
          // );
        }));
  }
}
