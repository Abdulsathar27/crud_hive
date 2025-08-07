import 'package:crud/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


ValueNotifier<List<MapEntry<dynamic, PersonData>>> personDataNotifier = ValueNotifier([]);


Future<void> getData({bool sortDescending = true}) async {
  var database = await Hive.openBox<PersonData>('data');


  List<MapEntry<dynamic, PersonData>> allData = database.toMap().entries.toList();


  allData.sort((a, b) {
    final aDate = a.value.addedOn;
    final bDate = b.value.addedOn;
    return sortDescending ? bDate.compareTo(aDate) : aDate.compareTo(bDate);
  });

  personDataNotifier.value.clear();
  personDataNotifier.value.addAll(allData);
  personDataNotifier.notifyListeners();
}


Future<void> addData(PersonData value) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.add(value);
  await getData(); 
}


Future<void> updateData(dynamic key, PersonData value) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.put(key, value);
  await getData(); 
}


Future<void> deleteData(dynamic key) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.delete(key);
  await getData(); 
}


Future<void> dateData() async {
  var database = await Hive.openBox<PersonData>('data');
  final dataList = database.toMap().entries.toList();

  dataList.sort((a, b) => b.value.addedOn.compareTo(a.value.addedOn));

  personDataNotifier.value = dataList;
  personDataNotifier.notifyListeners();
}
