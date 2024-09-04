import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/auth_controller.dart';
import 'package:school_staff/views/signUp_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> validateEmpty = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: validateEmpty,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "Sign In Now",
                  style: GoogleFonts.inter(color: Colors.black87, fontSize: 20),
                ),
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 25),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null||value.isEmpty) {
                          return "Enter Email";
                        }
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Email",
                        label: Text("Email"),
                      ),
                    ),
                  ),
                ), //Text Form Field
                SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 25),
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null||value.isEmpty) {
                          return "Enter Password";
                        }
                      },
                      obscureText: _isHidden,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Password",
                        label: Text("Password"),
                        suffixIcon: GestureDetector(
                            onTap: _togglePasswordView,
                            child: _isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),//Text Form Field
                Consumer<AuthController>(
                  builder: (context, AuthController, child) {
                    return Padding(
                          padding: const EdgeInsets.only(left: 98),
                          child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Color(0xFFAB5EDC),
                               foregroundColor: Colors.white,
                               minimumSize: Size(230, 50),
                             ),
                              onPressed: () async {
                                if (validateEmpty.currentState!.validate()) {
                                AuthController.isloading(true);
                                await AuthController.signIn(_emailController.text,
                                    _passwordController.text);
                                print(AuthController.loading);

                                  if (AuthController.user != null) {
                                    try {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Logged in Successfully")),
                                      );
          
                                      AuthController.isloading(false);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(e.toString())),
                                      );
                                    } finally {
                                      AuthController.isloading(false);
                                    }
                                  } else {
                                    AuthController.isloading(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Invalid input"),
                                      ),
                                    );
                                  }
                                }else{
                                  AuthController.isloading(false);
                                }
                              },
                              child:AuthController.loading?CircularProgressIndicator(): Text("Sign In"),
                            ),
                        );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account ?",style: GoogleFonts.inter(),),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          child: Text("Sign Up",style: GoogleFonts.inter(decoration: TextDecoration.underline,),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
