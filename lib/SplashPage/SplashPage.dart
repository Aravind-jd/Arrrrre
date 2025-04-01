import 'dart:async';

import 'package:flutter/material.dart';
import 'package:judo/Auth%20Page/AuthStatePage.dart';
import 'package:lottie/lottie.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _animation;

  // Check Login status with Firebase


  @override

  void initState() {
    super.initState();

    // Initialize the animation controller

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the animation curve and tween

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));

    // Start the animation

    _controller.forward();

    // Navigate to home page after the animation completes

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF050a30),

      body: Center(

        child: Image.asset(
            "assets/animation/Free.gif",

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          filterQuality: FilterQuality.high,
        ),

      ),

    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context,animation, secondaryAnimation) => AuthPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 0.1);
      const end = Offset.zero;
      const curve = Curves.bounceInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}