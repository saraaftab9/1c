import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_collage_app/screens/home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
