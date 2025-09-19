import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  @HiveField(2)
  int age;

  @HiveField(3)
  String classname;

  @HiveField(4)
   final DateTime addedOn;

  StudentModel(
    {
    required this.name,
    required this.address,
    required this.age,
    required this.classname,
    required this.addedOn,
    });
}
