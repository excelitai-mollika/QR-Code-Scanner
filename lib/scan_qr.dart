import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  final qrKey=GlobalKey(debugLabel: "QR");
  QRViewController? controller;
Barcode?barcode;
  void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller=controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode=barcode;
      });
    });
  }
//
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller=QRViewController();
//   }

  @override
  void reassemble() async{
    // TODO: implement reassemble
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(key: qrKey, onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            cutOutSize: MediaQuery.of(context).size.width*.8,
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 10,
            borderColor: Colors.teal
          ),),
          Positioned(
              bottom: 60,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text(barcode!=null?"Result: ${barcode!.code}":"Scan a Code!",maxLines: 3,style: TextStyle(
                    color: Colors.white
                  ),))),
          Positioned(
              top:70,
              right:120,

              child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(6)
            ),
                child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            IconButton(onPressed: ()async{
           await   controller!.toggleFlash();
           setState(() {

           });
            }, icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context,snapshot){
                    if(snapshot.data!=null){
                      return Icon( snapshot.data! ? Icons.flash_on:Icons.flash_off,color: Colors.white,);
                    }
                    else {
                      return Container();
                    }
                  },
                 )),
            IconButton(onPressed: ()async{
                await   controller!.flipCamera();
                setState(() {

                });
            }, icon:FutureBuilder(
                future: controller?.flipCamera(),
                builder: (context,snapshot){
                  if(snapshot.data!=null){
                    return Icon( Icons.switch_camera,color: Colors.white,);
                  }
                  else {
                    return Container();
                  }
                },
            )),
          ],),
              ))
        ],
      ),
    );
  }
}
