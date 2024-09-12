import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TimeTable",style: GoogleFonts.inter(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFAB5EDC),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFAB5EDC),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
            child: Column(

              children: [
                Card(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 10, 20),
                    lastDay: DateTime.utc(2030, 3, 20),
                    focusedDay: DateTime.now(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                      scrollDirection: Axis.vertical,
                      itemBuilder:(context,index){
                      return  Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 120,
                                margin: EdgeInsets.only(bottom: 30),
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
                                margin:EdgeInsets.only(bottom:30),
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
                      );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
