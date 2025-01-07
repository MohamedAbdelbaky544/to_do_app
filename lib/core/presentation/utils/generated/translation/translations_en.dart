import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get toDoApp => 'To Do App';

  @override
  String get tasks => 'Tasks';

  @override
  String get createdAt => 'createdAt';

  @override
  String get description => 'description';

  @override
  String get title => 'title';

  @override
  String get completed => 'Completed';

  @override
  String get unCompleted => 'InCompleted';

  @override
  String get thereIsNoTasksYet => 'There is no Tasks yet';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get confirm => 'Confirm';

  @override
  String get enterTitle => 'Enter Title';

  @override
  String get enterDescription => 'Enter description';

  @override
  String get thisFieldIsRequired => 'This field is required';

  @override
  String get addTask => 'Add Task';

  @override
  String get updateTask => 'Update task';

  @override
  String get taskStatus => 'Task Status';
}
