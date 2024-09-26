import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chartcontroller extends ChangeNotifier {
  final List<FlSpot> _spots = [];
  List<FlSpot> get spots => _spots;
}
