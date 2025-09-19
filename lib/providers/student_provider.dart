import 'package:crud/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';


class StudentProvider with ChangeNotifier {
  final Box<StudentModel> _studentBox = Hive.box<StudentModel>('studentBox');

  List<StudentModel> get students =>
    _studentBox.values.toList().reversed.toList();


  void addStudent(StudentModel student) async {
    await _studentBox.add(student);
    notifyListeners();
  }

  void updateStudent(int index, StudentModel updatedStudent) async {
    await _studentBox.putAt(index, updatedStudent);
    notifyListeners();
  }

  void deleteStudent(int index) async {
    await _studentBox.deleteAt(index);
    notifyListeners();
  }
}
