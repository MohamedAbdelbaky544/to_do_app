import 'package:injectable/injectable.dart';
import 'package:to_do_app/home/domain/repositories/task_repository.dart';

@lazySingleton
class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  void call({required int index}) {
    return repository.deleteTask(index: index);
  }
}
