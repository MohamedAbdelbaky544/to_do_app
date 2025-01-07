import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/core/data/utils/constants/constants.dart';
import 'package:to_do_app/home/data/models/task_model/task_model.dart';

abstract class ToDoDataSource {
  List<TaskModel>? getAllTasks();
  Future<void> addTask({
    required TaskModel newTask,
  });

  void deleteTask({required int index});

  void updateTask({required TaskModel updatedTask, required int index});
}

@LazySingleton(as: ToDoDataSource)
class ToDoDataSourceImpl implements ToDoDataSource {
  var hive = Hive.box<TaskModel>(HiveKeys.tasks);

  @override
  List<TaskModel>? getAllTasks() {
    return hive.values.toList();
  }

  @override
  Future<int> addTask({required TaskModel newTask}) async {
    return await hive.add(newTask);
  }

  @override
  void deleteTask({required int index}) {
    hive.deleteAt(index);
    // return hive.values.toList();
  }

  @override
  void updateTask({required TaskModel updatedTask, required int index}) {
    hive.putAt(index, updatedTask);
    // return hive.values.toList();
  }
}
