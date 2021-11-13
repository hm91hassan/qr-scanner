import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/page/generate.dart';
import 'package:qr_scanner/page/scaning_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String result = "Hey there dd!";
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: deprecated_member_use
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  int currentIndex = 0;

  Widget pageIndex() {
    List<Widget> pages = [
      ScaningScreen(),
      GeneratPage(),
    ];
    return IndexedStack(
      index: currentIndex,
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
      ),
      body: pageIndex(),

      bottomNavigationBar: Container(
        height: 60,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                  color: currentIndex == 0 ? Colors.green[400] : Colors.green,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ScaningScreen()));
                      },
                      icon: Icon(
                        Icons.qr_code_sharp,
                        color: Colors.white,
                      )),
                  Text(
                    "Scan",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                  color: currentIndex == 1 ? Colors.green[400] : Colors.green,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => GeneratPage()));
                      },
                      icon: Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      )),
                  Text(
                    "Genarate",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 34),
      //   height: 60,
      //   color: Colors.red,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           IconButton(
      //               onPressed: () {},
      //               icon: Icon(
      //                 Icons.qr_code_scanner_sharp,
      //                 color: Colors.white,
      //               )),
      //           Text(
      //             "Scan",
      //             style: TextStyle(color: Colors.white),
      //           )
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           IconButton(
      //               onPressed: () {},
      //               icon: Icon(
      //                 Icons.qr_code,
      //                 color: Colors.white,
      //               )),
      //           Text(
      //             "Genarate",
      //             style: TextStyle(color: Colors.white),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: const Icon(Icons.qr_code),
      //   label: const Text("Generate"),
      //   onPressed: () {

      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
