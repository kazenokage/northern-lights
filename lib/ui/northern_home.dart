import 'dart:math';

import 'package:flutter/material.dart';
import 'package:northern_lights/bloc/countries_bloc.dart';
import 'package:northern_lights/data/countries.dart';
import 'package:northern_lights/model/country.dart';
import 'package:northern_lights/ui/light_color_buttons.dart';
import 'package:northern_lights/ui/showcase_page.dart';

class NorthernHome extends StatefulWidget {
  NorthernHome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NorthernHomeState createState() => _NorthernHomeState();
}

class _NorthernHomeState extends State<NorthernHome> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(keepPage: true, initialPage: 0);
  }

  List<ShowcasePage> _getPages() {
    return Countries()
        .countries
        .map((index, country) => MapEntry(
            index,
            ShowcasePage(
              country: country,
            )))
        .values
        .toList();
  }

  Widget _buildHeader(AsyncSnapshot snap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          switchInCurve: Curves.ease,
          layoutBuilder: (current, previous) {
            return current;
          },
          duration: Duration(milliseconds: 1200),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap.data.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.cloud_queue,
                        size: 18,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      'Clear',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                )
              ],
              key: ValueKey(snap)),
        ),
        // Add the icon button here
        IconButton(
          icon: Icon(
            Icons.shuffle,
            color: Colors.white.withOpacity(0.6),
            size: 26,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1D1F),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (page) => CountriesBloc()
                .countryRequestSink
                .add(GetNewCountryEvent(index: page)),
            physics: ClampingScrollPhysics(),
            pageSnapping: true,
            controller: _controller,
            children: _getPages(),
          ),
          StreamBuilder(
            stream: CountriesBloc().countryStream,
            builder: (BuildContext context, AsyncSnapshot<Country> snap) {
              if (snap.hasData) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16,
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildHeader(snap),
                        LightColorButtons(
                          country: snap.data,
                          countryId: snap.data.id,
                          total: snap.data.lights.total,
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
