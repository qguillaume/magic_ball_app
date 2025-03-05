import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MagicBallApp());
}

class MagicBallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boule Magique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MagicBallHomePage(),
    );
  }
}

class MagicBallHomePage extends StatefulWidget {
  @override
  _MagicBallHomePageState createState() => _MagicBallHomePageState();
}

class _MagicBallHomePageState extends State<MagicBallHomePage> {
  final List<String> _responses = [
    'Oui',
    'Non',
    'Peut-être',
    'Pas sûr',
  ];

  String _currentResponse = 'Posez une question';

  void _shakeBall() {
    setState(() {
      _currentResponse = _responses[Random().nextInt(_responses.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boule Magique'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: _shakeBall,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.brown[300],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.brown[900]!.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _currentResponse,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}