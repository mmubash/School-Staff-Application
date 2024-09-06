import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Text("Demo Public School",style: GoogleFonts.inter(),),
     centerTitle: true,
      ),
      drawer:  Drawer(

        backgroundColor: Color(0xFFAB5EDC),
        child: Stack(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 730),
               child: Image.asset("assets/drawerimg.png",

                 width: 350,
                 height: 160,
                 fit: BoxFit.cover,

               )
             ),
             Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Card(
                  child: ListTile(
                    leading:CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtbMLV28IAwaSFKV1MN_JXCvUms4WWHEOqRQ&usqp=CAU'),
                    ),
                    title: Text('Neymar jr'),
                    onTap: () {

                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              ListTile(
                leading: Icon(Icons.dashboard_outlined),
                title: Text('Dashboard',style: GoogleFonts.inter(color: Colors.white),),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                title: Text('Attendance',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {

                },
              ),

              ListTile(
                leading: Icon(Icons.quiz_outlined),
                title: Text('Class Test',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {


                },
              ),
              ListTile(
                leading: Icon(Icons.create_outlined),
                title: Text('Assignment',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {


                },
              ),
              ListTile(
                leading: Icon(Icons.school_outlined),
                title: Text('Exams',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_month_sharp),
                title: Text('TimeTable',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {

                },
              ),

              Consumer<AuthController>(
                builder: (context, AuthController, child) {
                return Padding(
                  padding: const EdgeInsets.only(top: 390),
                  child: InkWell(
                    onTap: (){
                      AuthController.signOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),ModalRoute.withName('/'));
                    },
                    child: Container(
                      height: 50,
                      width: 700,
                      decoration: BoxDecoration(
                        color: Color(0xFFAB5EDC),
                      ),
                      child: Center(child: Text("Sign out ",style: GoogleFonts.inter(color: Colors.white,fontSize: 20),)),
                    ),
                  ),
                );}
              )
            ],
          )],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: 500,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFAB5EDC)
            ),
          )
        ],
      )
    );
  }
}
