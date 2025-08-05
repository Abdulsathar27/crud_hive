// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonDataAdapter extends TypeAdapter<PersonData> {
  @override
  final int typeId = 0;

  @override
  PersonData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonData(
      name: fields[0] as String?,
      address: fields[1] as String?,
      age: fields[2] as String?,
      classname: fields[3] as String?,
      addedOn: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PersonData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.classname)
      ..writeByte(4)
      ..write(obj.addedOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
