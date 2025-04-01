import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judo/Home%20Dupe%20Page/HomeDupePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with TickerProviderStateMixin {

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.cyanAccent,

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

        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Homedupepage(),
                  ),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left
            )
        ),

        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,

      ),



    );
  }
}
