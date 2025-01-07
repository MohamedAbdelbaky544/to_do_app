import 'package:to_do_app/home/domain/entities/enums/task_status.dart';

class Tasks {
  final String id;
  final String title;
  final String description;
  final TaskStatus status;
  final DateTime createdAt;

  Tasks({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });
}
