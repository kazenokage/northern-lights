import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:northern_lights/bloc/countries_bloc.dart';
import 'package:northern_lights/model/lights.dart';

class ColorButton extends StatelessWidget {
  final int countryId;
  final Light light;
  final LightColor colorName;
  final double total;

  ColorButton({@required this.colorName, @required this.countryId, @required this.light, @required this.total});

  double convertIntensity() => (light.intensity / total) * 100;

  @override
  Widget build(BuildContext context) {
    double converted = max(10, convertIntensity());
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        CountriesBloc().updateEventSink.add(UpdateEvent(countryId: countryId, lightColor: colorName, change: total*0.10));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 40,
          height: 40,
          child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1500),
              curve: Curves.ease,
              height: converted,
              width: converted,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: light.color.withOpacity((light.intensity / total)*2),
                      blurRadius: 50,
                      spreadRadius: 10
                    )
                  ],
                  color: light.color,
                  borderRadius: BorderRadius.circular(converted)),
            ),
          ),
        ),
      ),
    );
  }
}
