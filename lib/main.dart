import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:northern_lights/ui/northern_home.dart';
import 'package:northern_lights/ui/northern_theme.dart';

void main() => runApp(NorthernApp());

class NorthernApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    );
    return MaterialApp(
      title: 'Northern Lights',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: NorthernTheme.textTheme
      ),
      home: NorthernHome(title: 'Northern Lights'),
      debugShowCheckedModeBanner: false,
    );
  }
}
