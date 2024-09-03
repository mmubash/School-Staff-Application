import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/views/login_page.dart';

import '../Controller/auth_controller.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _fNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "First Name",
                      label: Text("First Name"),
                    ),
                  ),
                ),
              ),// First Name Text Form Field
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _lNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "Last Name",
                      label: Text("Last Name"),
                    ),
                  ),
                ),
              ),//Last Name Text Form Field
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "Email",
                      label: Text("Email"),
                    ),
                  ),
                ),
              ),//Email Text Form Field
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "Password",
                      label: Text("Password"),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),//Password Text Form Field
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _conPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      hintText: "Confirm Password",
                      label: Text("Confirm Password"),
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),//Confirm Password Text Form Field
              SizedBox(height: 40),
              ElevatedButton(
                  style: ButtonStyle(
                  ),
                  onPressed: () async {
                       final authController = Provider.of<AuthController>(context,listen: false);
                       final result = await authController.signUp(_fNameController.text,_lNameController.text,_emailController.text,_passwordController.text);

                       if (result == 'Sign up successful') {
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text("Account created Successfully")),
                         );

                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                       } else {
                         // Show error message
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text(result)),
                         );
                       }
                       },

                  child: Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}
