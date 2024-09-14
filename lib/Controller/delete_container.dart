import 'package:flutter/cupertino.dart';

class DeleteContainer with ChangeNotifier {
  List<String> testHeading = ['Test 1', 'Test 2', 'Test 3', 'Test 4', 'Test 5', 'Test 6'];
  List<String> subjectHeading = ['English', 'Maths', 'Urdu', 'Physics', 'Science', 'Chemistry'];
  List<String> classHeading = ['Xi Rose', 'xii Rose', 'ix Rose', 'vi Rose', 'vii Rose', 'v Rose'];
  List<String> date = ['22/4/2024', '21/5/2024', '20/3/2024', '19/4/2024', '18/6/2024', '17/6/2024'];
  List<Map<String, String>> combinedList = [];

  // Constructor
  DeleteContainer() {
    containerList();
  }

  void containerList() {
    combinedList.clear();
    for (int i = 0; i < testHeading.length; i++) {
      combinedList.add({
        'Test': testHeading[i],
        'Subject': subjectHeading[i],
        'Class': classHeading[i],
        'Date': date[i]
      });
    }
    notifyListeners();
  }

  void removeContainer(int index) {
    if (combinedList.isEmpty) {
      print("Cannot remove item: combinedList is empty.");
      return;
    }

    if (index >= 0 && index < combinedList.length) {
      combinedList.removeAt(index);
      notifyListeners();
    } else {
      print("Invalid index $index: Valid range is 0 to ${combinedList.length - 1}.");
    }
  }
}
