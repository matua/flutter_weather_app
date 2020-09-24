import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:red_weather/Degrees.dart';

import 'Temperature.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Temperature(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.red[700],
        appBar: AppBar(
          title: Text('Weather Forecast'),
          centerTitle: true,
          backgroundColor: Colors.red[700],
        ),
        body: Column(
          children: [
            _searchCity(),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0), child: _cityName()),
            _todaysDate(),
            _todaysWeather(context),
            _weatherDetails(),
            _weatherForecast(),
            Container(
              height: 115,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) => Container(
                    padding: EdgeInsets.all(8), child: _forecastDay(index)),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  var temperatureIncrementer =
                      Provider.of<Temperature>(context, listen: false);
                  temperatureIncrementer.incrementCounter();
                },
                child: Icon(Icons.navigation),
              ),
            ),
            // _weatherForecast(),
          ],
        ),
      ),
    );
  }
}

Container _forecastDay(int index) {
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.4),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Column(
      children: [
        Text(
          'Friday',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$index °C',
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              Icons.wb_sunny,
              size: 30,
            ),
          ],
        )
      ],
    ),
  );
}

Column _weatherForecast() {
  return Column(
    children: [
      Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          color: Colors.grey[300],
        ),
      ),
    ],
  );
}

Row _weatherDetails() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(
            Icons.wb_sunny,
            size: 25,
          ),
          Text('5'),
          Text('km/hr'),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.wb_cloudy,
            size: 25,
          ),
          Text('10'),
          Text('km/hr'),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.wb_sunny,
            size: 25,
          ),
          Text('1'),
          Text('km/hr'),
        ],
      )
    ],
  );
}

Row _todaysWeather(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(
        Icons.wb_sunny,
        size: 50,
      ),
      Column(
        children: [
          Degrees(),
          _currentWeatherDescription(),
        ],
      ),
    ],
  );
}

Text _currentWeatherDescription() {
  return Text(
    'LIGHT SNOW',
    style: (TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
  );
}

Text _todaysDate() {
  return Text(
    'Wednesday, SEP 2, 2020',
    style: TextStyle(fontSize: 20, color: Colors.grey[300]),
  );
}

Text _cityName() {
  return Text(
    'Kampala, Uganda',
    style: TextStyle(fontSize: 35),
  );
}

Row _searchCity() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: () {
          return null;
        },
      ),
      Text(
        'Enter City Name',
        style: TextStyle(fontSize: 20),
      ),
    ],
  );
}
