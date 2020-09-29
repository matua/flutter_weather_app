import 'package:flutter/material.dart';

class Degrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Consumer<Temperature>(
    //   builder: (context, counter, child) => Text(
    //     counter.getTemperature().toString() + ' °C',
    //     style: (TextStyle(fontSize: 90, fontWeight: FontWeight.w200)),
    //   ),
    // );
    return Text(
      "25",
      style: (TextStyle(fontSize: 45, fontWeight: FontWeight.w200)),
    );
  }
}
