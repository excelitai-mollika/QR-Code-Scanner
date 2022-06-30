import 'package:flutter/material.dart';
import 'package:qr_app/create_qr_code.dart';
import 'package:qr_app/home_screen.dart';
import 'package:qr_app/scan_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        //   /* dark theme settings */
        // ),


        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

