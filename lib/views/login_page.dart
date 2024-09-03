import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/auth_controller.dart';
import 'package:school_staff/views/signUp_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState>validateEmpty =GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden =true;
  void _togglePasswordView(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Form(
       key: validateEmpty,
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             SizedBox(height: 80,),
             Text("Welcome Back",
               style: GoogleFonts.inter(
                 color: Colors.black87,
                 fontWeight: FontWeight.bold,
                 fontSize: 20
               ),
             ),
             Text("Sign In Now",
               style: GoogleFonts.inter(
                   color: Colors.black87,
                   fontSize: 20
               ),
             ),
             SizedBox(height: 100,),
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
                     hintText: "User Name",
                     label: Text("User Name"),
                   ),
                 ),
               ),
             ),//Text Form Field
             SizedBox(height: 40),
             Padding(
               padding: const EdgeInsets.only(left: 35,right: 35),
               child: SizedBox(
                 width: 300,
                 child: TextFormField(
                   obscureText: _isHidden,
                   controller: _passwordController,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(30)
                     ),
                     hintText: "Password",
                     label: Text("Password"),
                     suffixIcon: GestureDetector(
                       onTap: _togglePasswordView,
                         child: _isHidden?Icon(Icons.visibility_off):Icon(Icons.visibility)
                     ),
                   ),
                 ),
               ),
             ),//Text Form Field
             ElevatedButton(
               style: ButtonStyle(
               ),
                 onPressed: (){
                 final authController = Provider.of<AuthController>(context,listen: false);
                 authController.signIn(_emailController.text, _passwordController.text);

                 },
       
                 child: Text("Sign In")),
             SizedBox(height: 10,),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't Have Account ?"),
                 SizedBox(width: 10,),
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                   },
                     child: Text("Sign Up")
                 )
               ],
             )
       
           ],
         ),
       ),
     ),
    );
  }
}
