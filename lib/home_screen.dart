import 'package:flutter/material.dart';
import 'package:qr_app/create_qr_code.dart';
import 'package:qr_app/scan_qr.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("QR APP"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:( context)=>ScanQR()));
            }, child:const Text("QR Scanner")),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:( context)=>QRCodeCreate()));
            }, child:const Text("QR Generator")),
          ],
        ),
      ),
    );
  }
}
