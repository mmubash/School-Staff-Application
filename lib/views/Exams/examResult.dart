import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ExamResult extends StatelessWidget {
  const ExamResult({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Color(0xFFF2ABFE),
      Color(0xFFBAECEC),
      Color(0xFF9C93FF),
      Color(0xFF9A9A9A),
      Color(0xFFF5CEAA)];

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
                "Enter Exam Result",
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
            const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
            child: SizedBox.expand(
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 380,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFAB5EDC)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Color(0xFFAB5EDC),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("Test Title",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 150,
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
                                child: Center(child: Text("Subject",style: GoogleFonts.inter(color: Colors.black),),),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 150,
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
                                child: Center(child: Text("Maximum Grading",style: GoogleFonts.inter(color: Colors.black),),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 220),
                          child: GestureDetector(
                            child: Container(
                              height: 40,
                              width: 120,
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
                              child: Center(child: Text("Save",style: GoogleFonts.inter(color: Colors.white),),),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Total Studets-25",style: GoogleFonts.inter(color: Colors.black),),
                        SizedBox(height: 5,),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 110,
                                height: 70,
                                margin: EdgeInsets.only(bottom:  25),
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
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: SizedBox(
                                        height:30,
                                        width:40,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
