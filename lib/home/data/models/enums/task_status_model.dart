import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/home/domain/entities/enums/task_status.dart';

part 'task_status_model.g.dart';

@HiveType(typeId: 0)
enum TaskStatusModel {
  @HiveField(0)
  completed,
  @HiveField(1)
  inCompleted,
}

extension MapToDomain on TaskStatusModel {
  TaskStatus toDomain() => TaskStatus.values.firstWhere(
        (element) => element.name == name,
      );
}

extension MapFromDomain on TaskStatus {
  TaskStatusModel fromDomain() => TaskStatusModel.values.firstWhere(
        (element) => element.name == name,
      );
}
