import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/presentation/bloc/base_states/base_state.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/use_cases/delete_task_use_case.dart';

@lazySingleton
class DeleteTaskCubit extends Cubit<BaseState<List<Tasks>?>> {
  final DeleteTaskUseCase useCase;
  DeleteTaskCubit(this.useCase) : super(const BaseState());

  void deleteTask({
    required Tasks task,
  }) async {
    emit(state.setInProgressState());
    final result = useCase.call(task);
    emit(state.setSuccessState(result));
  }
}
