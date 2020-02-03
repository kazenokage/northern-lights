import 'package:flutter/material.dart';
import 'package:northern_lights/model/lights.dart';

class Country {
  int id;
  String name;
  AssetImage image;
  Lights lights = Lights();

  Country({@required this.id, @required this.image, @required this.name});
}