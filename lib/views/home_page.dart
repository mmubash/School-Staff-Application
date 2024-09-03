import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Text("Welcome to Home Page"),
          ElevatedButton(onPressed: (){
            final authController =Provider.of<AuthController>(context,listen: false);
            authController.signOut();
          },
              child: Text("Sign Out"))
        ],
      ),
    );
  }
}
