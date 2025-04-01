import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judo/Home%20Dupe%20Page/HomeDupePage.dart';
import 'package:judo/Login%20and%20registeration/LoginPage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key, this.email});
  final String? email;

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> with SingleTickerProviderStateMixin{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLogin = false;
  late AnimationController _controller;

  late var _nameController = TextEditingController();
  late var _emailController = TextEditingController();
  late var _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool tap = true;
  bool pressed = true;
  bool click = true;

  // Authentication
  Future<void> _authenticate() async {
    // Check if email or password fields are empty
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return; // Exit the function early if validation fails
    }

    setState(() {
      _isLogin = true;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await userCredential.user!.updateDisplayName(_nameController.text);

      // Navigate to the login page after successful sign-up
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLogin = false;
      });
    }
  }

  // // Google Authentication
  // Future<UserCredential?> loginWithGoogle() async {
  //   try{
  //     final googleUser = await GoogleSignIn().signIn();
  //   }catch(e) {
  //     print(e.toString());
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

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

      body: Center(

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),

                child: Form(
                  key: formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //Sign up Image

                      Image.asset(
                        "assets/images/signup.png",
                      ),

                      // Profile Photo

                      // Stack(
                      //   children: [
                      //
                      //     CircleAvatar(
                      //       radius: 50,
                      //       backgroundImage: _image != null
                      //           ? FileImage(_image!)
                      //           : null, // Display selected image
                      //       child: _image == null ? Icon(
                      //         Icons.person,
                      //         size: 50,
                      //       ) : null,
                      //     ),
                      //
                      //     // Overlay Button
                      //
                      //     Positioned(
                      //       bottom: 4,
                      //       right: 4,
                      //
                      //       child: GestureDetector(
                      //         onTap: _showImageSourceDialog,
                      //
                      //         child: Container(
                      //           padding: EdgeInsets.all(6),
                      //
                      //           decoration: BoxDecoration(
                      //             color: Colors.redAccent,
                      //             shape: BoxShape.circle,
                      //           ),
                      //
                      //           child: Icon(
                      //               Icons.camera_alt_outlined,
                      //               color: Colors.white,
                      //               size: 20
                      //           ),
                      //         ),
                      //
                      //       ),
                      //
                      //     ),
                      //
                      //   ],
                      // ),

                      //Name feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            obscureText: false,
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.redAccent
                              ),

                              labelText: "Name",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Name",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                            ),

                            onSaved: (value) => _nameController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Name is Required.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      // Email feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            obscureText: false,
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.redAccent
                              ),

                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                            ),

                            onSaved: (value) => _emailController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Email is Required.";
                              }
                              if(!value.contains('@gmail.com')){
                                return "Email is Not Valid.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      //Password feild

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),

                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: tap,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.redAccent
                              ),

                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  fontFamily: "Lora"
                              ),

                              filled: true,
                              fillColor: Colors.grey[200],

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    tap = !tap;
                                  });
                                },
                                child: tap ?
                                const Icon(Icons.visibility_rounded)
                                    : const Icon(Icons.visibility_off_rounded),
                              ),

                            ),

                            onChanged: (value) =>
                            {debugPrint("typed value -> $value")},

                            onSaved: (value) => _passwordController = value! as TextEditingController,
                            validator: (value) {

                              if(value == null || value.isEmpty){
                                return "Password is Required.";
                              }
                              return null;
                            },

                          ),

                        ),

                      ),

                      //Register Button

                      SizedBox(

                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),

                          child: ElevatedButton(
                            onPressed: _isLogin ? null : _authenticate,

                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor: Colors.grey[300],
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            child: _isLogin ? CircularProgressIndicator(color: Colors.teal)
                                : Text(
                              "Register",
                              style: TextStyle(
                                fontFamily: "Lora",
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),

                        ),

                      ),

                      //Login page button

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),

                              child: Text(
                                "Already have an Account?",

                                style: TextStyle(
                                  fontFamily: "Lora",
                                ),

                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),

                              child: Text(
                                "|",

                                style: TextStyle(
                                  fontFamily: "Lora",
                                  fontWeight: FontWeight.bold,

                                ),

                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.center,

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),

                              child: TextButton(

                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                                ),

                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Loginpage()
                                    ),
                                  );

                                },

                                child: const Text(
                                  "Sign In",

                                  style: TextStyle(
                                      fontFamily: "Lora",
                                      fontWeight: FontWeight.bold
                                  ),

                                ),

                              ),

                            ),

                          ),

                        ],
                      ),



                      // ElevatedButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //         "Sign-in with Google",
                      //       style: TextStyle(
                      //         fontFamily: "Lora",
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      // ),

                    ],
                  ),

                ),

              ),

            ],
          ),

        ),

      ),

    );
  }
}

