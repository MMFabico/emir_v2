import 'package:emir_v2/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EMIRApp());
}

class EMIRApp extends StatelessWidget {
  const EMIRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignInScreen(),
    );
  }
}
