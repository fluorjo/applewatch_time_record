import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SfRadialGauge(
          title: GaugeTitle(
              text: 'Speedometer',
              textStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(minimum: 0, maximum: 150, pointers: <GaugePointer>[
              NeedlePointer(value: 90, enableAnimation: true)
            ], ranges: <GaugeRange>[
              GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
              GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
              GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
            ], annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text(
                    '90.0 MPH',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  positionFactor: 0.5,
                  angle: 90)
            ])
          ],
        ),
      ),
    ));
  }
}