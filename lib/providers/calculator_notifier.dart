import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorNotifier extends ChangeNotifier {
  String _display = '0';
  double _result = 0;

  String get display => _display;
  double get result => _result;

  void updateDisplay(String value) {
    if (_display == '0' && value != '.') {
      _display = value;
    } else if (_display.contains('.') && value == '.') {
      return;
    } else {
      _display += value;
    }
    notifyListeners();
  }

  void clearDisplay() {
    _display = '0';
    _result = 0;
    notifyListeners();
  }

  void calculate() {
    Parser p = Parser();
    Expression exp = p.parse(_display);
    ContextModel cm = ContextModel();
    _result = exp.evaluate(EvaluationType.REAL, cm);
    _display = _result.toString();
    notifyListeners();
  }
}
