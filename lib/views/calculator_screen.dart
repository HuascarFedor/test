import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculadora_app/providers/calculator_notifier.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculatorNotifier = Provider.of<CalculatorNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              calculatorNotifier.display,
              style: const TextStyle(fontSize: 64),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7', context),
              buildButton('8', context),
              buildButton('9', context),
              buildButton('/', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4', context),
              buildButton('5', context),
              buildButton('6', context),
              buildButton('*', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1', context),
              buildButton('2', context),
              buildButton('3', context),
              buildButton('-', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('0', context),
              buildButton('.', context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: calculatorNotifier.calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      '=',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              buildButton('+', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: calculatorNotifier.clearDisplay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      'C',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, BuildContext context) {
    final calculatorNotifier = Provider.of<CalculatorNotifier>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: () => calculatorNotifier.updateDisplay(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
