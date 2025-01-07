import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/home/data/models/enums/task_status_model.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final TaskStatusModel status;
  @HiveField(4)
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });
}

extension MapToDomain on TaskModel {
  Tasks toDomain() => Tasks(
      id: id,
      title: title,
      description: description,
      status: status.toDomain(),
      createdAt: createdAt);
}

extension MapFromDomain on Tasks {
  TaskModel fromDomain() => TaskModel(
      id: id,
      title: title,
      description: description,
      status: status.fromDomain(),
      createdAt: createdAt);
}
