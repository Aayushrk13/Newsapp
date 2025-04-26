// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articlemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlemodelAdapter extends TypeAdapter<Articlemodel> {
  @override
  final int typeId = 0;

  @override
  Articlemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Articlemodel(
      publisher: fields[0] as String?,
      author: fields[1] as String?,
      description: fields[3] as String?,
      imgurl: fields[5] as String?,
      title: fields[2] as String?,
      content: fields[6] as String?,
      url: fields[4] as String?,
      mark: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Articlemodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.publisher)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.imgurl)
      ..writeByte(6)
      ..write(obj.content)
      ..writeByte(7)
      ..write(obj.mark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
