import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/presentation/bloc/base_states/base_state.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/domain/use_cases/get_all_tasks_use_case.dart';

@lazySingleton
class GetAllTasksCubit extends Cubit<BaseState<List<Tasks>?>> {
  final GetAllTasksUseCase useCase;
  GetAllTasksCubit(this.useCase) : super(const BaseState());

  void getTasks() async {
    emit(state.setInProgressState());
    final result = useCase.call();
    emit(state.setSuccessState(result));
  }
}
