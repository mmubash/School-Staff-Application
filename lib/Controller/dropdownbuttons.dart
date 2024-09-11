import 'package:flutter/cupertino.dart';

class DropDownMethods with ChangeNotifier{
  List<String> gradingTypes=['Grade','Marks','None'];
  List<String> subjectTypes=['English','Maths','Urdu'];
  List<String> examTypes=['Mid-term','Finals'];
  List<String> classSections=['CS-101','BSSE-12','IT-01'];
  String? selectedGrade ;
  String? selectedSection ;
  String? selectedSubject;
  String? selectedExam;
  setGrade(String? value){
    selectedGrade = value;
    notifyListeners();
  }
  setSubject(String? value){
    selectedSubject = value;
    notifyListeners();
  }
  setClassSection(String? value){
    selectedSection = value;
    notifyListeners();
  }
  setExamType(String? value){
    selectedExam = value;
    notifyListeners();
  }
}