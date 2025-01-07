import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/core/data/utils/constants/constants.dart';
import 'package:to_do_app/home/data/models/task_model/task_model.dart';

abstract class ToDoDataSource {
  List<TaskModel>? getAllTasks();
  Future<void> addTask({
    required TaskModel newTask,
  });

  List<TaskModel>? deleteTask({
    required TaskModel task,
  });

  List<TaskModel>? updateTask({
    required TaskModel updatedTask,
  });
}

@LazySingleton(as: ToDoDataSource)
class ToDoDataSourceImpl implements ToDoDataSource {
  var hive = Hive.box<TaskModel>(HiveKeys.tasks);

  @override
  List<TaskModel>? getAllTasks() {
    return hive.values.toList().reversed.toList();
  }

  @override
  Future<int> addTask({required TaskModel newTask}) async {
    return await hive.add(newTask);
  }

  @override
  List<TaskModel>? deleteTask({required TaskModel task}) {
    hive.values.toList().removeWhere((e) => e == task);
    return hive.values.toList().reversed.toList();
  }

  @override
  List<TaskModel>? updateTask({required TaskModel updatedTask}) {
    hive.values.toList().removeWhere((e) => e.id == updatedTask.id);
    addTask(newTask: updatedTask);
    return hive.values.toList().reversed.toList();
  }
}
