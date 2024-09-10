import 'package:flutter/cupertino.dart';

class Dropdownbuttons with ChangeNotifier{
  var gradingTypes=['Grade','Marks','None'];
  var selectedGrade ;
  setGrade(value){
    selectedGrade = value;
    ChangeNotifier();
  }
}