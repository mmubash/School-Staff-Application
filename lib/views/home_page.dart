import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/views/login_page.dart';

import '../Controller/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Page "),
            Text("Welcome to Home Page"),
            ElevatedButton(onPressed: (){
              final authController =Provider.of<AuthController>(context,listen: false);
              authController.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            },
                child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
