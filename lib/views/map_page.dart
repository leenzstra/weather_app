import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/services/provider.dart';
import 'package:weather_app/services/themeProvider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    WeatherProvider provider = Provider.of<WeatherProvider>(context);
    double lat = provider.lat;
    double lon = provider.lon;

    return Scaffold(
        appBar: AppBar(
          title: Text('Карта', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: provider.secondAccent,
        ),
        body: Container(
            color: theme.primaryColor,
            child: WebView(
              initialUrl:
                  'https://openweathermap.org/weathermap?basemap=map&cities=true&layer=temperature&lat=$lat&lon=$lon&zoom=50',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            )));
  }
}
