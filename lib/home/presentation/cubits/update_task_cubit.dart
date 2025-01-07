import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/presentation/bloc/base_states/base_state.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/use_cases/update_task_use_case.dart';

@lazySingleton
class UpdateTaskCubit extends Cubit<BaseState<int>> {
  final UpdateTaskUseCase useCase;
  UpdateTaskCubit(this.useCase) : super(const BaseState());

  void updateTask({required Tasks task, required int index}) async {
    emit(state.setInProgressState());
    useCase.call(params: task, index: index);
    emit(state.setSuccessState(index));
  }
}
