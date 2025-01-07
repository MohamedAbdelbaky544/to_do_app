import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app.dart';
import 'package:to_do_app/core/data/utils/constants/constants.dart';
import 'package:to_do_app/home/data/models/enums/task_status_model.dart';
import 'package:to_do_app/home/data/models/task_model/task_model.dart';
import 'package:to_do_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TaskStatusModelAdapter());

  await Hive.openBox<TaskModel>(HiveKeys.tasks);
  runApp(const App());
}
