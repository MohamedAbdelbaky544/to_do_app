import 'package:injectable/injectable.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/repositories/task_repository.dart';

@lazySingleton
class GetAllTasksUseCase {
  final TaskRepository repository;

  GetAllTasksUseCase({required this.repository});

  List<Tasks>? call() {
    return repository.getTasks();
  }
}
