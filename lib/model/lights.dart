import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:northern_lights/ui/northern_colors.dart';

class Lights {
  Map<LightColor, Light> _lights;
  
  Lights(){
    _lights = {
      LightColor.red: Light(intensity: Random().nextInt(51).toDouble(), color: NorthernColors.auroraRed),
      LightColor.violet: Light(intensity: Random().nextInt(51).toDouble(), color: NorthernColors.auroraViolet),
      LightColor.blue: Light(intensity: Random().nextInt(51).toDouble(), color: NorthernColors.auroraBlue),
      LightColor.green: Light(intensity: Random().nextInt(51).toDouble(), color: NorthernColors.auroraGreen),
      LightColor.yellow: Light(intensity: Random().nextInt(51).toDouble(), color: NorthernColors.auroraYellow)
    };
  }

  void updateLight(LightColor light, double change) {
    _lights[light].updateIntensity(change);
  }

  Map<LightColor, Light> get getLights => _lights;
  double get total => _lights.values.map((v) => v.intensity).toList().reduce((sum, val) => sum + val);
}

class Light {
  double intensity;
  final Color color;

  Light({@required this.intensity, @required this.color});

  Color get getColor => color;
  double get getIntensity => intensity;

  void updateIntensity(double newIntensity) { intensity = intensity + newIntensity; }
}

enum LightColor {
  red,violet,blue,green,yellow
}
