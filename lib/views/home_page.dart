import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/views/Assignments/showAssignments.dart';
import 'package:school_staff/views/Authentication/login_page.dart';
import 'package:school_staff/views/Class%20Test/showClassTest.dart';
import 'package:school_staff/views/Exams/showExam.dart';
import 'package:school_staff/views/mark_attendance.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Controller/auth_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
List chartData=[
  [40,"Present",Colors.green],
  [30,"Absent",Colors.red],
  [30,"leave",Colors.blue]
];
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Color(0xFFDEC8F3), Color(0xFFC7DAFF),Color(0xFFC99CF7)];
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Public School",style: GoogleFonts.inter(fontWeight: FontWeight.w700,color: Colors.white),),
     centerTitle: true,
        backgroundColor: Color(0xFFAB5EDC),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                title: Text('Attendance',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MarkAttendance()));

                },
              ),

              ListTile(
                leading: Icon(Icons.quiz_outlined),
                title: Text('Class Test',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowClassTest()));
                },
              ),
              ListTile(
                leading: Icon(Icons.create_outlined),
                title: Text('Assignment',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowAssignments()));
                },
              ),
              ListTile(
                leading: Icon(Icons.school_outlined),
                title: Text('Exams',style: GoogleFonts.inter(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowExam()));

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              width: 500,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFAB5EDC)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
              child:  Card(
                shadowColor: Colors.grey,
              child: SizedBox(
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center align the content
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0), // Reduced padding
                    child: Text(
                      "Attendance",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6B38BF),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SfCircularChart(
                      series: [
                        DoughnutSeries(
                          dataSource: chartData,
                          yValueMapper: (data, _) => data[0],
                          xValueMapper: (data, _) => data[1],
                          pointColorMapper: (data, _) => data[2],
                          radius: '50%',
                          innerRadius: '80%',
                        ),
                      ],
                      legend: Legend(
                        isVisible: true,
                        position: LegendPosition.bottom,
                        orientation: LegendItemOrientation.horizontal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400,left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Class Incharge",style: GoogleFonts.inter(color: Color(0xFF6B38BF),fontWeight: FontWeight.w500),),
                      IconButton(
                          onPressed: (){}, icon: Image.asset("assets/arrow.png"))
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 130,
                          height: 80,
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: colors[index%colors.length],
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(image: AssetImage("assets/classIcon.png")),
                                Text(
                                  "XII Lily",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subject Incharge",style: GoogleFonts.inter(color: Color(0xFF6B38BF),fontWeight: FontWeight.w500),),
                      IconButton(
                          onPressed: (){}, icon: Image.asset("assets/arrow.png"))
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 130,
                          height: 80,
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color:colors[index%colors.length],
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "XII Lily",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Accounts",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage("assets/book.png")),
                                      SizedBox(width: 22,),
                                      Image(image: AssetImage("assets/arrow.png"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Live Class",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xFF6B38BF)),),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF3E5FB)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: Row(
                          children:[
                           Image.asset("assets/live.png"),
                           SizedBox(width: 10,),
                           Text("Heading",style: GoogleFonts.inter(fontWeight:FontWeight.w700,color:Colors.black),),
                          ]
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 33),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("GeoGraphy class",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                             Text("30/2/2024\  4:30pm",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Class XII",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                                 Icon(Icons.delete_outline_outlined)
                               ],
                             ),

                           ],
                         ),
                       ),
                     ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Upcoming Lectures",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xFF6B38BF)),),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 120,

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,

                              offset: Offset(0, 3),
                            ),
                          ],
                          color:Color(0xFFAB5EDC),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("10pm Lecture",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.white),),
                            Text("IV-Lecture",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Colors.white),),

                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,

                              offset: Offset(0, 3),
                            ),
                          ],
                          color:Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Economics",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xFF774D92)),),
                            Text("XII-Rose",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xFFAB5EDC)),),

                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Notifications",style: GoogleFonts.inter(fontWeight: FontWeight.w500,color: Color(0xFF6B38BF)),),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(

                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
                          height: 150,
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color:colors[index%colors.length],
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                          ),
                          child: Center(
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Dear Staff\n Members \n Meeting has \n has been\n sheduled on\n Monday"),
                          )
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )


          ],
        ),
      )
    );
  }
}
