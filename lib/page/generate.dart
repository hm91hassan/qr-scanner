import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratPage extends StatefulWidget {
  const GeneratPage({Key? key}) : super(key: key);

  @override
  _GeneratPageState createState() => _GeneratPageState();
}

class _GeneratPageState extends State<GeneratPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data: result,
                  version: QrVersions.auto,
                  size: 300.0,
                  backgroundColor: Colors.white,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Enter your text",
                  ),
                  controller: myController,
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Scan")),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                result = myController.text;
                              });
                              myController.clear();
                              print("result$result");
                            }
                          },
                          child: Text("Generate")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
