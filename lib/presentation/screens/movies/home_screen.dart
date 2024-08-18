import 'package:cinemapedia/config/constant/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(Environment.theMovieDbApiKey),
      ),
    );
  }
}
