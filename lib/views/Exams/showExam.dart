import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/dropdownbuttons.dart';
import 'package:school_staff/views/Exams/createExam.dart';

class ShowExam extends StatelessWidget {
  const ShowExam({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Color(0xFFD397EF), Color(0xFFE49359),Color(0xFFB0C9FB),];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFFAB5EDC),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close,color: Colors.white,)),
              SizedBox(
                width: 5,
              ),
              Text("Exam",style: GoogleFonts.inter(color: Colors.white),),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateExam()));
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
                        Text("Create Exam",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Consumer<DropDownMethods>(
                      builder: (context,value,child) {
                        return Container(
                          height: 50,
                          width: 122,
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
                            padding: const EdgeInsets.all(10),
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
                                      "Class ",
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
                  child: Consumer<DropDownMethods>(
                      builder: (context,value,child) {
                        return Container(
                          height: 50,
                          width: 126,
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
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: value.selectedSubject,
                                icon: Icon(Icons.arrow_drop_down),
                                items: value.subjectTypes.map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint:const  Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "Subject ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.0,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ),
                                onChanged: (String? v){
                                  value.setSubject(v);
                                },
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                GestureDetector(
                  child: Consumer<DropDownMethods>(
                      builder: (context,value,child) {
                        return Container(
                          height: 50,
                          width: 126,
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
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: value.selectedExam,
                                icon: Icon(Icons.arrow_drop_down),
                                items: value.examTypes.map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint:const  Center(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "Exam",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 40.0,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ),
                                onChanged: (String? v){
                                  value.setExamType(v);
                                },
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),

              ],
            ),
            SizedBox(height: 40,),
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
