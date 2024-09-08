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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:320,right: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(800),),
                  color: Color(0xFFAB5EDC),
                ),
                height: 100,
                width: 100,
              ),
            ),
            SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          child: Consumer<AuthController>(
                              builder: (context, AuthController, child) {

                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Password";
                                    }else if(value.length<7){
                                      return"Password must be greater then 6 characters";
                                    }

                                  },
                                  obscureText:AuthController.hide,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              30)),
                                      hintText: "Password",
                                      label: const Text("Password"),
                                      suffixIcon: InkWell(
                                        onTap: AuthController.isHide,
                                        child: Icon(
                                          AuthController.hide?Icons.visibility_off:Icons.visibility,
                                        ),
                                      )
                                  ),
                                );

                              }

                          ),
                        ),
                      ), //Password Text Form Field
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35,bottom: 0),
                        child: SizedBox(
                          width: 300,
                          child: Consumer<AuthController>(
                              builder: (context, AuthController, child) {

                                return TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Confirm Password";
                                    }else if(value!=_passwordController.text){
                                      return"Confirm Password does not match";
                                    }
                                    return null;

                                  },
                                  obscureText:AuthController.conPasswordHide,
                                  controller: _conPasswordController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              30)),
                                      hintText: "Confirm Password",
                                      label: const Text("Confirm Password"),
                                      suffixIcon: InkWell(
                                        onTap: AuthController.isConPasswordHide,
                                        child: Icon(
                                          AuthController.conPasswordHide?Icons.visibility_off:Icons.visibility,
                                        ),
                                      )
                                  ),
                                );
                              }
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
                                    try {
                                      await AuthController.signUp(
                                          _fNameController.text, _lNameController.text,
                                          _emailController.text,
                                          _passwordController.text);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                            content:
                                            Text("Signed up Successfully")),
                                      );

                                      AuthController.isloading(false);
                                    } catch (e) {
                                     await ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(e.toString())),
                                      );
                                      AuthController.isloading(false);
                                    }

                                }
                              },
                                child: AuthController.loading?CircularProgressIndicator(color: Colors.white,):Text("Sign Up"),

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
                                  Provider.of<AuthController>(context,listen: false).isHide();
                                  Provider.of<AuthController>(context,listen: false).isConPasswordHide();
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
            Padding(
              padding: const EdgeInsets.only(left:0,right: 320,top: 800),
              child: Container(
                height: 100,
                width: 100,
                decoration: (BoxDecoration(
                  color: Color(0xFFAB5EDC),
                  borderRadius: BorderRadius.only(topRight:Radius.circular(800),),
                )),
              ),
            )
          ]
        ),
      ),
    );
  }
}
