import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/core/domain/entities/failures.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/repositories/task_repository.dart';

@lazySingleton
class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(Tasks params) {
    return repository.addTask(params);
  }
}
