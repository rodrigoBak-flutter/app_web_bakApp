import 'package:flutter/material.dart';
import 'package:app_porfolio_bakapp/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Este widget es la raíz de su aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rodrigo Bak - Developer Portfolio',
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.locale(context), // Add the locale here
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(
          // Este es el tema de su aplicación.
          fontFamily: 'Barlow',
          textTheme: TextTheme(
              headline1: const TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline2: const TextStyle(
                  fontSize: 55,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline3: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              subtitle1: TextStyle(fontSize: 30, color: Colors.grey[500]),
              subtitle2: TextStyle(fontSize: 20, color: Colors.grey[500]),
              bodyText1: const TextStyle(
                  fontSize: 20, color: Colors.white, height: 1.25),
              bodyText2: const TextStyle(
                  fontSize: 17, color: Colors.white, height: 1.25),
              caption: const TextStyle(
                  fontSize: 15, color: Colors.white, height: 1.25),
              button: const TextStyle(fontSize: 17, color: Color(0xff1e1e24)))),
      home: HomePage(),
    );
  }
}
