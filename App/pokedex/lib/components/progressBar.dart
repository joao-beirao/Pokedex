import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class progressBar extends StatelessWidget {
  String label;
  int value;
  Color color;

  progressBar({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    if (value > 150) {
      value = 150;
    }

    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      lineHeight: 10,
      percent: (value / 150),
      progressColor: color,
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
    );
  }
}
