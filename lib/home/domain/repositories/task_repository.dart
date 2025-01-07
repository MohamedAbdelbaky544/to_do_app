import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/domain/entities/failures.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';

abstract class TaskRepository {
  Future<Either<Failure, Unit>> addTask(Tasks newTask);
  List<Tasks>? updateTask(Tasks updatedTask);
  List<Tasks>? deleteTask(Tasks deleteTask);
  List<Tasks>? getTasks();
}
