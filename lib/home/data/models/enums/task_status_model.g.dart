// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'task_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatusModelAdapter extends TypeAdapter<TaskStatusModel> {
  @override
  final int typeId = 0;

  @override
  TaskStatusModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatusModel.completed;
      case 1:
        return TaskStatusModel.uncompleted;
      default:
        return TaskStatusModel.completed;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatusModel obj) {
    switch (obj) {
      case TaskStatusModel.completed:
        writer.writeByte(0);
        break;
      case TaskStatusModel.uncompleted:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
