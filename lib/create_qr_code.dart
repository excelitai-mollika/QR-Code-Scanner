import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
class QRCodeCreate extends StatefulWidget {
  const QRCodeCreate({Key? key}) : super(key: key);

  @override
  _QRCodeCreateState createState() => _QRCodeCreateState();
}

class _QRCodeCreateState extends State<QRCodeCreate> {
//String qrData="bppshops.com";
  TextEditingController qRcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            QrImage(
              data:qRcontroller.text,
              size: 200,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: qRcontroller,
              decoration: InputDecoration(
                  hintText: "Enter your link here..."
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              //Button for generating QR code
              child: TextButton(
                onPressed: ()  {
                  //a little validation for the textfield
                  // if (qRcontroller.text.isEmpty) {
                  //   setState(() {
                  //     qrData = "";
                  //   });
                  // }
                  // else {
                    setState(() {

                    });

                },

                child: Text("Generate QR Code",style: TextStyle(color: Colors.indigo[900],),),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
