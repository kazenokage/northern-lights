import 'package:flutter/widgets.dart';
import 'package:northern_lights/model/country.dart';
import 'package:northern_lights/model/lights.dart';

class Countries {

  Map<int,Country> _countries;

  Countries(){
    _countries = Map<int,Country>();
    _populateCountries();
  }

  void _populateCountries() {
    _countries.addAll({
      0: Country(id: 0, name: 'Iceland', image: AssetImage('assets/images/iceland.jpg')),
      1: Country(id: 1, name: 'Norway', image: AssetImage('assets/images/norway.jpg')),
      2: Country(id: 2, name: 'Sweden', image: AssetImage('assets/images/sweden.jpg')),
      3: Country(id: 3, name: 'Finland', image: AssetImage('assets/images/finland.jpg')),
    });
  }

  Country getCountry(int i) {
    return _countries.containsKey(i) ? _countries[i] : _countries[0];
  }

  void updateCountryLightIntensity(int i, LightColor color, double change) {
    if (_countries.containsKey(i)) {
      _countries[i].lights.updateLight(color, change);
    }
  }

  Map<int,Country> get countries => _countries;
  
}