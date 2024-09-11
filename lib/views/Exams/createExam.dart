import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/dropdownbuttons.dart';
import 'package:school_staff/views/Class%20Test/testResult.dart';

import '../home_page.dart';
import 'examResult.dart';

class CreateExam extends StatelessWidget {
  CreateExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB5EDC),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                "Create Exam",
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(color: Color(0xFFAB5EDC)),
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
              child: SizedBox(
                height: 900,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset("assets/classTest/t1.png"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Test Title"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset("assets/classTest/t2.png"),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Class Section"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/classTest/t3.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Subject"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/classTest/t4.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Test Date"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset("assets/classTest/t5.png"),
                            SizedBox(width: 10),
                            Consumer<DropDownMethods>(
                              builder: (context, value, child) {
                                return SizedBox(
                                  width: 300,
                                  height: 60,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: value.selectedGrade ??
                                          "Select Grade Type",
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text('Grade Type',style: GoogleFonts.inter(),),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GestureDetector(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(Icons.close,))
                                              ],
                                            ),
                                            content: Consumer<DropDownMethods>(
                                                builder: (context, value, child) {
                                                  return Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Divider(
                                                          color: Color(0xFF9053CD),
                                                        ),
                                                        ListTile(
                                                          title: Text("Marks"),
                                                          leading: Radio<String>(
                                                            value: "Marks",
                                                            groupValue: value.selectedGrade,
                                                            onChanged: (String? newValue) {
                                                              value.setGrade(newValue);
                                                            },
                                                          ),
                                                        ),
                                                        ListTile(
                                                          title: Text("Grade"),
                                                          leading: Radio<String>(
                                                            value: "Grade",
                                                            groupValue: value.selectedGrade,
                                                            onChanged: (String? newValue) {
                                                              value.setGrade(newValue);
                                                            },
                                                          ),
                                                        ),
                                                        ListTile(
                                                          title: Text("None"),
                                                          leading: Radio<String>(
                                                            value: "None",
                                                            groupValue: value.selectedGrade,
                                                            onChanged: (String? newValue) {
                                                              value.setGrade(newValue);
                                                            },
                                                          ),
                                                        )
                                                      ]

                                                  );
                                                }),
                                            actions: [
                                              Center(
                                                child: SizedBox(
                                                  height:45,
                                                  width:150,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Submit",style: GoogleFonts.inter(color: Colors.white),),
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Color(0xFFAB5EDC),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15),
                                                        )

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/classTest/t7.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Maximum Grade"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/classTest/t7.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Minimum Grade"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/classTest/t8.png",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: "Projection"),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ExamResult()));
                        },
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFAB5EDC)),
                          child: Center(
                              child: Text(
                                "Create Exam",
                                style: GoogleFonts.inter(color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
