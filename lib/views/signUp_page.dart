import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/views/login_page.dart';

import '../Controller/auth_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> validateEmpty = GlobalKey<FormState>();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: validateEmpty,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                      ),
                      SizedBox(width: 10,),
                      Text("Sign Up",style: GoogleFonts.inter(fontSize: 30,color:Color(0xFFAB5EDC) ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return "Enter First Name";
                          }
                          return null;
                        },
                        controller: _fNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "First Name",
                          label: Text("First Name"),
                        ),
                      ),
                    ),
                  ), // First Name Text Form Field
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return "Enter Last Name";
                          }
                        },
                        controller: _lNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Last Name",
                          label: Text("Last Name"),
                        ),
                      ),
                    ),
                  ), //Last Name Text Form Field
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return "Enter Email";
                          }
                          return null;
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
                  ), //Email Text Form Field
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Password",
                          label: Text("Password"),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                  ), //Password Text Form Field
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null||value.isEmpty) {
                            return "Enter Confirm Password";
                          }
                          return null;
                        },
                        controller: _conPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Confirm Password",
                          label: Text("Confirm Password"),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                  ), //Confirm Password Text Form Field
                  SizedBox(height: 40),
                  Consumer<AuthController>(
                    builder: (context, AuthController, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFAB5EDC),
                            foregroundColor: Colors.white,
                            minimumSize: Size(230, 50),
                          ),
                          onPressed: ()  async {
                            if (validateEmpty.currentState!.validate()) {
                              AuthController.isloading(true);
                              await AuthController.signUp(
                                  _fNameController.text, _lNameController.text,
                                  _emailController.text,
                                  _passwordController.text);
                              print(AuthController.loading);

                              if (AuthController.user != null) {
                                try {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text("Signed up Successfully")),
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
                            }
                          },
                            child: AuthController.loading?CircularProgressIndicator():Text("Sign Up"),

                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account ?",
                          style: GoogleFonts.inter(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.inter(
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
