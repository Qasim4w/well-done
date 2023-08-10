// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FriendsModelAdapter extends TypeAdapter<FriendsModel> {
  @override
  final int typeId = 2;

  @override
  FriendsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FriendsModel(
      friendsname: fields[0] as String,
      targetname: fields[1] as String,
      Friendsopacity: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FriendsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.friendsname)
      ..writeByte(1)
      ..write(obj.targetname)
      ..writeByte(2)
      ..write(obj.Friendsopacity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
