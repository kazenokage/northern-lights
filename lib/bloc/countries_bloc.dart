import 'package:flutter/widgets.dart';
import 'package:northern_lights/data/countries.dart';
import 'package:northern_lights/model/country.dart';
import 'package:northern_lights/model/lights.dart';
import 'package:rxdart/rxdart.dart';

class CountriesBloc {
  static Countries _countriesData;

  static BehaviorSubject<Country> _countryStream;

  static BehaviorSubject<GetNewCountryEvent> _countryRequestSink;
  static BehaviorSubject<UpdateEvent> _updateEventSink;

  static final CountriesBloc _countriesBloc = CountriesBloc._internal();
  factory CountriesBloc() => _countriesBloc;

  CountriesBloc._internal() {
    _countriesData = Countries();

    _countryStream = BehaviorSubject<Country>();
    _countryStream.add(_countriesData.getCountry(0));

    _countryRequestSink = BehaviorSubject<GetNewCountryEvent>();
    _countryRequestSink.listen((request) {
      getNewCountry(request.index);
    });

    _updateEventSink = BehaviorSubject<UpdateEvent>();
    _updateEventSink.listen((update) {
      _updateLightIntensity(update.countryId, update.lightColor, update.change);
    });
  }

  void _updateLightIntensity(int countryId, LightColor lightColor, double change) {
    _countriesData.updateCountryLightIntensity(countryId, lightColor, change);
    _countryStream.add(_countriesData.getCountry(countryId));
  }

  void getNewCountry(int index) {
    _countryStream.add(_countriesData.getCountry(index));
  }

  BehaviorSubject<Country> get countryStream => _countryStream;
  BehaviorSubject<GetNewCountryEvent> get countryRequestSink => _countryRequestSink;
  BehaviorSubject<UpdateEvent> get updateEventSink => _updateEventSink;
}

class UpdateEvent {
  final int countryId;
  final LightColor lightColor;
  final double change;
  UpdateEvent({@required this.countryId, @required this.lightColor, @required this.change});
}

class GetNewCountryEvent{
  final int index;
  GetNewCountryEvent({@required this.index});
}