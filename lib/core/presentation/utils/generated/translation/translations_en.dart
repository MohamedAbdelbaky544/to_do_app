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
  String get unCompleted => 'UnCompleted';

  @override
  String get thereIsNoTasksYet => 'There is no Tasks yet';
}
