import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judo/Home%20Dupe%20Page/HomeDupePage.dart';
import 'package:judo/Home%20Page/HomePage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(

      stream: FirebaseAuth.instance.authStateChanges(), // Listen to auth changes
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting)
        {
          // Show loading indicator while checking auth state

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData)
        {
          // If the user is logged in, go to HomePage

          return Homepage();
        }
        else {
          // Otherwise, go to HomeDupePage

          return Homedupepage();
        }
      },

    );
  }
}
