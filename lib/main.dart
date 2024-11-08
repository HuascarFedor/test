import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculadora_app/providers/calculator_notifier.dart';
import 'package:calculadora_app/views/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorNotifier(),
      child: MaterialApp(
        title: 'Flutter Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.all(20),
              elevation: 0,
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}
