import 'package:flutter/material.dart';

enum TaskStatus {
  completed,
  uncompleted,
}

Color statusTextColor(TaskStatus status) {
  switch (status) {
    case TaskStatus.completed:
      return const Color(0xff46CF8B);
    case TaskStatus.uncompleted:
      return const Color(0xff666666);
    default:
      return const Color(0xff666666);
  }
}
