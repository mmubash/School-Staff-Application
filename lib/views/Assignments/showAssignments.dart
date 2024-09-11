import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_staff/views/Assignments/createAssignment.dart';
class ShowAssignments extends StatelessWidget {
  const ShowAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Color(0xFFD397EF), Color(0xFFE49359),Color(0xFFB0C9FB),];
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
     centerTitle: true,
        backgroundColor: Color(0xFFAB5EDC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAssignment()));
              },
              child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Create Assignment",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: SizedBox(
                width: 120,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Search"),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {

                  return Container(
                    height: 200,
                    width: 300,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(40) ),
                        color: colors[index%colors.length]
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
                              Text("XII Rose",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                              Text("English",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                              Text("22/4/2024",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                              Text("Attachment",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                              Divider(color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.check_circle_outline,),
                                    Text("Enter Result",style: GoogleFonts.inter(color: Colors.white),),
                                    Icon(Icons.message),

                                    Text("Publish",style: GoogleFonts.inter(color: Colors.white),),
                                    Icon(Icons.delete_outline_outlined,),

                                    Text("Delete",style: GoogleFonts.inter(color: Colors.white),),


                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
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
