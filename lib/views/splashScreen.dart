import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_staff/views/auth_wrapper.dart';

    class Splashscreen extends StatefulWidget {
      const Splashscreen({super.key});
    
      @override
      State<Splashscreen> createState() => _SplashscreenState();
    }
    
    class _SplashscreenState extends State<Splashscreen> {
      void initState(){
        super.initState();
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthWrapper()));
        });
        }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Color(0xFF7D45A1),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                  gradient: RadialGradient(
                   colors: [
                   Colors.white, Color(0xFF7D45A1),
                      ],
                   center: Alignment.center,
                    ),
                   ),
                    child: Image.asset("assets/logo.png")
                ),
                SizedBox(height: 20,),
                Text("My School\n Staff App"
                    ,style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                    ))
              ],
            ),
          ),
        );
      }
    }
    