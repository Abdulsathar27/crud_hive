import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class PersonData {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? address;

  @HiveField(2)
  String? age;

  @HiveField(3)
  String? classname;

  @HiveField(4)
   final DateTime addedOn;

  PersonData(
    {
    this.name,
    this.address,
    this.age,
    this.classname,
    required this.addedOn,
    });
}
