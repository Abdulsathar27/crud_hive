import 'package:crud/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class StudentProvider with ChangeNotifier {
  final Box<StudentModel> _studentBox = Hive.box<StudentModel>('studentBox');

  
  List<StudentModel> get students =>
      _studentBox.values.toList().reversed.toList();

  Future<void> addStudent(StudentModel student) async {
    await _studentBox.add(student);
    notifyListeners();
  }

  Future<void> updateStudent(
    StudentModel student, {
    required String newName,
    required int newAge,
    required String newAddress,
    required String newClassname,
  }) async {
    student.name = newName;
    student.age = newAge;
    student.address = newAddress;
    student.classname = newClassname;
    student.addedOn = DateTime.now(); 
    await student.save(); 
    notifyListeners();
  }

  Future<void> deleteStudent(StudentModel student) async {
    await student.delete(); 
    notifyListeners();
  }
}
