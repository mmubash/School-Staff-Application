import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class DropDownMethods with ChangeNotifier{
  List<String> gradingTypes=['Grade','Marks','None'];
  List<String> subjectTypes=['English','Maths','Urdu'];
  List<String> examTypes=['Mid-term','Finals'];
  List<String> classSections=['CS-101','BSSE-12','IT-01'];
  String? selectedGrade ;
  String? selectedSection ;
  String? selectedSubject;
  String? selectedExam;
  DateTime? _selectedDay=null;
  DateTime _focusedDay=DateTime.now();
  DateTime? get selectedDay =>_selectedDay;
  DateTime get focusedDay => _focusedDay;
   setDay(DateTime selectDay,DateTime focusDay){
    _selectedDay=selectDay;
    _focusedDay=focusDay;
    notifyListeners();
  }
  setFocus(DateTime focusedDay){
     _focusedDay=focusedDay;
     notifyListeners();
  }

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