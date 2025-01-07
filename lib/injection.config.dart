// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:to_do_app/home/data/data_source/local/to_do_data_source.dart'
    as _i367;
import 'package:to_do_app/home/data/repositories/task_repository_impl.dart'
    as _i620;
import 'package:to_do_app/home/domain/repositories/task_repository.dart'
    as _i733;
import 'package:to_do_app/home/domain/use_cases/add_task_use_case.dart'
    as _i488;
import 'package:to_do_app/home/domain/use_cases/delete_task_use_case.dart'
    as _i122;
import 'package:to_do_app/home/domain/use_cases/get_all_tasks_use_case.dart'
    as _i613;
import 'package:to_do_app/home/domain/use_cases/update_task_use_case.dart'
    as _i50;
import 'package:to_do_app/home/presentation/cubits/add_task_cubit.dart'
    as _i216;
import 'package:to_do_app/home/presentation/cubits/delete_task_cubit.dart'
    as _i468;
import 'package:to_do_app/home/presentation/cubits/get_all_tasks_cubit.dart'
    as _i1004;
import 'package:to_do_app/home/presentation/cubits/update_task_cubit.dart'
    as _i917;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i367.ToDoDataSource>(() => _i367.ToDoDataSourceImpl());
    gh.lazySingleton<_i733.TaskRepository>(
        () => _i620.TaskRepositoryImpl(local: gh<_i367.ToDoDataSource>()));
    gh.lazySingleton<_i488.AddTaskUseCase>(
        () => _i488.AddTaskUseCase(repository: gh<_i733.TaskRepository>()));
    gh.lazySingleton<_i122.DeleteTaskUseCase>(
        () => _i122.DeleteTaskUseCase(repository: gh<_i733.TaskRepository>()));
    gh.lazySingleton<_i613.GetAllTasksUseCase>(
        () => _i613.GetAllTasksUseCase(repository: gh<_i733.TaskRepository>()));
    gh.lazySingleton<_i50.UpdateTaskUseCase>(
        () => _i50.UpdateTaskUseCase(repository: gh<_i733.TaskRepository>()));
    gh.lazySingleton<_i468.DeleteTaskCubit>(
        () => _i468.DeleteTaskCubit(gh<_i122.DeleteTaskUseCase>()));
    gh.lazySingleton<_i917.UpdateTaskCubit>(
        () => _i917.UpdateTaskCubit(gh<_i50.UpdateTaskUseCase>()));
    gh.lazySingleton<_i1004.GetAllTasksCubit>(
        () => _i1004.GetAllTasksCubit(gh<_i613.GetAllTasksUseCase>()));
    gh.factory<_i216.AddTaskCubit>(
        () => _i216.AddTaskCubit(gh<_i488.AddTaskUseCase>()));
    return this;
  }
}
