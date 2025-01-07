import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_app/core/presentation/bloc/base_states/base_state.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/use_cases/add_task_use_case.dart';

@injectable
class AddTaskCubit extends Cubit<BaseState<Unit>> {
  final AddTaskUseCase useCase;
  AddTaskCubit(this.useCase) : super(const BaseState());

  void addNewTask({required Tasks task}) async {
    emit(state.setInProgressState());
    final result = await useCase.call(task);
    result.fold(
      (failure) => emit(state.setFailureState(failure)),
      (success) => emit(state.setSuccessState(success)),
    );
  }
}
