import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MarkAttendance extends StatelessWidget {
  MarkAttendance({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Color(0xFFDEC8F3), Color(0xFFC7DAFF),Color(0xFFC99CF7),Color(0xFFF5CEAA),Color(0xFF9A9A9A)];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB5EDC),
        title: Text("Attendance"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Mark Attendance",style: GoogleFonts.inter(color: Color(0xFF6B38BF),fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    height: 25,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("24/5/2024",style: GoogleFonts.inter(color: Colors.black),),),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("1-A",style: GoogleFonts.inter(color: Colors.black),),),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Color(0xFFAB5EDC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("View",style: GoogleFonts.inter(color: Colors.black),),),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text("Total Students-24",style: GoogleFonts.inter(color: Colors.black54,fontWeight: FontWeight.w400),),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 16,
                itemBuilder: (context, index) {
                  return Container(
                    width: 110,
                    height: 70,
                    margin: EdgeInsets.only(bottom:  20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: colors[index%colors.length],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListTile(
                            leading:CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtbMLV28IAwaSFKV1MN_JXCvUms4WWHEOqRQ&usqp=CAU'),
                            ),
                            title: Text('Neymar jr',style: GoogleFonts.inter(color:Colors.white),),
                            subtitle:Text('Roll no 1',style: GoogleFonts.inter(color:Colors.white),),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 35,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Text("P",style: GoogleFonts.inter(color: Colors.green),),),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
