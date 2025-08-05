import 'package:crud/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<PersonData>> PersonDataNotifier = ValueNotifier([]);

Future<void> getData({bool sortDescending = true}) async {
  var database = await Hive.openBox<PersonData>('data');
  List<PersonData> allData = database.values.toList();
  
  allData.sort((a, b) {
    final aDate = a.addedOn;
    final bDate = b.addedOn;
    return sortDescending ? bDate.compareTo(aDate) : aDate.compareTo(bDate);
  });

  PersonDataNotifier.value.clear();
  PersonDataNotifier.value.addAll(allData); 
  PersonDataNotifier.notifyListeners();
}



Future<void> addData(PersonData value) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.add(value);
  await getData();
}

Future<void> updateData(int index, PersonData value) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.putAt(index, value);
  getData();
}

Future<void> deleteData(int index) async {
  var database = await Hive.openBox<PersonData>('data');
  await database.deleteAt(index);
  getData();
}

Future<void> dateData() async {
  var database = await Hive.openBox<PersonData>('data');
  final dataList = database.values.toList();

  dataList.sort((a, b) => b.addedOn.compareTo(a.addedOn));

  PersonDataNotifier.value = dataList;
  PersonDataNotifier.notifyListeners();
}
