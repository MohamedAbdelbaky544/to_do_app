import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/core/domain/entities/failures.dart';
import 'package:to_do_app/home/data/data_source/local/to_do_data_source.dart';
import 'package:to_do_app/home/data/models/task_model/task_model.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/repositories/task_repository.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final ToDoDataSource local;
  TaskRepositoryImpl({required this.local});
  @override
  Future<Either<Failure, Unit>> addTask(Tasks newTask) async {
    await local.addTask(newTask: newTask.fromDomain());
    return right(unit);
  }

  @override
  List<Tasks>? deleteTask(Tasks deleteTask) {
    List<TaskModel>? request = local.deleteTask(task: deleteTask.fromDomain());
    if (request != null) {
      return request.map((e) => e.toDomain()).toList();
    } else {
      return null;
    }
  }

  @override
  List<Tasks>? getTasks() {
    List<TaskModel>? request = local.getAllTasks();
    if (request != null) {
      return request.map((e) => e.toDomain()).toList();
    } else {
      return null;
    }
  }

  @override
  List<Tasks>? updateTask(Tasks updatedTask) {
    List<TaskModel>? request =
        local.updateTask(updatedTask: updatedTask.fromDomain());
    if (request != null) {
      return request.map((e) => e.toDomain()).toList();
    } else {
      return null;
    }
  }
}
