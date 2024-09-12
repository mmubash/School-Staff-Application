import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Controller/dropdownbuttons.dart';
class ViewAttendance extends StatelessWidget {
   ViewAttendance({super.key});

  List chartData=[
    [40,"Present",Colors.green],
    [30,"Absent",Colors.red],
    [30,"leave",Colors.blue]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance",style: GoogleFonts.inter(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFAB5EDC),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("View Attendance",style: GoogleFonts.inter(color: Color(0xFF6B38BF),fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Consumer<DropDownMethods>(
                        builder: (context,value,child) {
                          return Container(
                            height: 50,
                            width: 130,
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
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: value.selectedSection,
                                  icon: Icon(Icons.arrow_drop_down),
                                  items: value.classSections.map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: const Center(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Text(
                                        "Class",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 50.0,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                    ),
                                  ),
                                  onChanged: (String? v){
                                    value.setClassSection(v);
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 130,
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
                      child: Center(child: Text("Name",style: GoogleFonts.inter(color: Colors.black),),),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 130,
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
              SizedBox(height: 15,),
              Card(
               child: TableCalendar(
                  firstDay: DateTime.utc(2020, 10, 20),
                  lastDay: DateTime.utc(2030, 3, 20),
                  focusedDay: DateTime.now(),
                ),
            ),
              SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                width: 88,
                height: 90,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Color(0xFF70D9A0),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("14",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                       ),
                      SizedBox(height: 10,),
                      Text(
                        "Present",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

                  Container(
                    width: 88,
                    height: 90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Color(0xFF718CEA),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("1",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Leave",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: 88,
                    height: 90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Color(0xFFFAA7A7),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("2",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Absent",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 30,right: 30),
                child:  Card(
                  shadowColor: Colors.grey,
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SfCircularChart(
                            series: [
                              DoughnutSeries(
                                dataSource: chartData,
                                yValueMapper: (data, _) => data[0],
                                xValueMapper: (data, _) => data[1],
                                pointColorMapper: (data, _) => data[2],
                                radius: '80%',
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

          ],),
        ),
      ),
    );
  }
}
