import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Temperature.dart';

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
      Provider.of<Temperature>(context, listen: true)
          .getTemperature()
          .toString(),
      style: (TextStyle(fontSize: 45, fontWeight: FontWeight.w200)),
    );
  }
}
