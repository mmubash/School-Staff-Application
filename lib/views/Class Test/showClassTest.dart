import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:school_staff/Controller/delete_container.dart';
import 'package:school_staff/Controller/dropdownbuttons.dart';
import 'package:school_staff/views/Class%20Test/createTest.dart';
import 'package:school_staff/views/home_page.dart';


class ShowClassTest extends StatelessWidget {
  const ShowClassTest({super.key});

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                  child: Icon(Icons.close,color: Colors.white,)),
              SizedBox(
                width: 5,
              ),
              Text("Class Test",style: GoogleFonts.inter(color: Colors.white),),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTest()));
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
                        Text("Create Test",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
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
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
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
                                      "Class Section",
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                    "Subject type",
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

              ],
            ),
            SizedBox(height: 40,),
            Consumer<DeleteContainer>(
              builder: (context,value,child){
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.combinedList.length ,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 300,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.5),
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
                                  Text('${value.combinedList[index]['Test']}',
                                      style: GoogleFonts.inter(fontWeight:FontWeight.w700,color:Colors.black),),
                                ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 33),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${value.combinedList[index]['Subject']}",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                                Text("${value.combinedList[index]['Class']}",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
                                Text("${value.combinedList[index]['Date']}",style: GoogleFonts.inter(fontWeight:FontWeight.w400,color:Colors.black),),
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
                                      GestureDetector(
                                        onTap: (){
                                          value.combinedList.removeAt(index);
                                          print("******* item Deleted");
                                        },
                                          child: Icon(Icons.delete_outline_outlined,)),
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
              );}
            ),
          ],
        ),
      ),
    );
  }
}
