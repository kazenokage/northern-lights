import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:northern_lights/model/country.dart';
import 'package:northern_lights/ui/color_button.dart';

class LightColorButtons extends StatelessWidget {
  final Country country;
  final int countryId;
  final double total;

  LightColorButtons(
      {@required this.country, @required this.countryId, @required this.total});

  List<Widget> _buildButtons() {
    return country.lights.getLights
        .map((k, v) => MapEntry(
            k,
            ColorButton(
              countryId: countryId,
              colorName: k,
              light: v,
              total: total,
            )))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: DarkBackgroundWrapper(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildButtons(),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Center(
            child: IconButton(
          icon: Icon(
            Icons.list,
            color: Colors.white.withOpacity(0.8),
          ),
          onPressed: () {},
        ))
      ],
    );
  }
}

// Swap to this for demo purposes
class BlurBackgroundWrapper extends StatelessWidget {
  final Widget child;

  BlurBackgroundWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: child,
    );
  }
}

class DarkBackgroundWrapper extends StatelessWidget {
  final Widget child;

  DarkBackgroundWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0x33000000), borderRadius: BorderRadius.circular(20)),
        child: child,
      ),
    );
  }
}
