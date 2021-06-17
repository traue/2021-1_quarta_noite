import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Artboard _riveArtboard;
  late RiveAnimationController _controller;

  bool get isPlaying => _controller.isActive;

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/coracao.riv').then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      artboard.addController(_controller = SimpleAnimation('animacao'));
      setState(() {
        _riveArtboard = artboard;
      });
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
            child: _riveArtboard == null
                ? const SizedBox()
                : Rive(artboard: _riveArtboard)),
      ),
    );
  }
}
