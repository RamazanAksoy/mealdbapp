// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favori.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriAdapter extends TypeAdapter<Favori> {
  @override
  final int typeId = 1;

  @override
  Favori read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favori(
      name: fields[0] as String?,
      idMeal: fields[1] as String?,
      photoUrl: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Favori obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.idMeal)
      ..writeByte(2)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
