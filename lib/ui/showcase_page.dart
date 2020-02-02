import 'package:flutter/material.dart';
import 'package:northern_lights/model/country.dart';

class ShowcasePage extends StatelessWidget {
  final Country country;

  ShowcasePage({@required this.country});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: country.image, fit: BoxFit.cover)),
        ),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x44000000),
                Color(0xCC000000)
              ],
              stops: [0,0.8],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
        ),
      ],
    );
  }
}
