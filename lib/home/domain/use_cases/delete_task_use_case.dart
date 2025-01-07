import 'package:injectable/injectable.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/repositories/task_repository.dart';

@lazySingleton
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  List<Tasks>? call(Tasks params) {
    return repository.deleteTask(params);
  }
}
