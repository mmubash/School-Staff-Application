import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CreateAssignment extends StatelessWidget {
  const CreateAssignment({super.key});

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
                "Create Test",
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(color: Color(0xFFAB5EDC)),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
            child: SizedBox.expand(
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
                                  hintText: "Topic Name"),
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
                                  hintText: "Assignment description"),
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
                                  hintText: "Due Date"),
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
                            "assets/classTest/t6.png",
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
                                  hintText: "Time"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:130),
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                offset: Offset(0, 4)
                              ),],
                              color: Colors.white),
                          child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.attachment_outlined),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Attachement",
                                    style: GoogleFonts.inter(color: Colors.black),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFAB5EDC)),
                        child: Center(
                            child: Text(
                              "Share Assignment",
                              style: GoogleFonts.inter(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
