import 'package:flutter/material.dart';
import 'package:judo/Login%20and%20registeration/LoginPage.dart';
import 'package:judo/Login%20and%20registeration/RegisterPage.dart';

class Homedupepage extends StatefulWidget {
  const Homedupepage({super.key});

  @override
  State<Homedupepage> createState() => _HomedupepageState();
}

class _HomedupepageState extends State<Homedupepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffa4a2e8),

      appBar: AppBar(

        title: Text(
          "J U D O",
          style: TextStyle(
            fontFamily: "PirataOne",
            fontStyle: FontStyle.italic,
            fontSize: 30,
            shadows: [

              Shadow(
                blurRadius: 20.0,
                color: Colors.white,
                offset: Offset(0, 5),
              ),

              Shadow(
                blurRadius: 30.0,
                color: Colors.white30,
                offset: Offset(0, 5),
              ),

            ],
          ),
        ),

        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,

        actions: [

          PopupMenuButton<MenuItem>(
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            onSelected: (value) {
              if(value == MenuItem.login) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Loginpage()),
                );
              }
              else if(value == MenuItem.signup) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Registerpage()),
                );
              }
            },

            itemBuilder: (context) => [

              PopupMenuItem(
                value: MenuItem.login,
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontFamily: "PirataOne",
                    fontSize: 20,
                  ),
                ),
              ),

              PopupMenuItem(
                value: MenuItem.signup,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontFamily: "PirataOne",
                    fontSize: 20,
                  ),
                ),
              ),

            ],
          ),

        ],

      ),

    );
  }

}

enum MenuItem {
  login,
  signup,
}