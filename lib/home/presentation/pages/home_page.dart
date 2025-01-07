import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/presentation/bloc/base_states/base_state.dart';
import 'package:to_do_app/core/presentation/themes/app_theme.dart';
import 'package:to_do_app/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:to_do_app/core/presentation/utils/generated/translation/translations.dart';
import 'package:to_do_app/home/domain/entities/enums/task_status.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/presentation/cubits/add_task_cubit.dart';
import 'package:to_do_app/home/presentation/cubits/delete_task_cubit.dart';
import 'package:to_do_app/home/presentation/cubits/get_all_tasks_cubit.dart';
import 'package:to_do_app/home/presentation/cubits/update_task_cubit.dart';
import 'package:to_do_app/injection.dart';

class HomePage extends StatefulWidget {
  static const String path = '/Home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AddTaskCubit addTaskCubit = getIt<AddTaskCubit>();
  final GetAllTasksCubit getAllTasksCubit = getIt<GetAllTasksCubit>();
  final UpdateTaskCubit updateTaskCubit = getIt<UpdateTaskCubit>();
  final DeleteTaskCubit deleteTaskCubit = getIt<DeleteTaskCubit>();

  int completed = 0;
  int uncompleted = 0;

  @override
  void initState() {
    addTaskCubit.addNewTask(
      task: Tasks(
          id: '1',
          title: 'title',
          description: 'description',
          status: TaskStatus.uncompleted,
          createdAt: DateTime.now()),
    );
    getAllTasksCubit.getTasks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Translations tr = Translations.of(context)!;
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all<Color?>(
                Theme.of(context).appColors.blackColor,
              ),
            ),
        child: Icon(
          Icons.add,
          color: Theme.of(context).appColors.whiteColor,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddTaskCubit, BaseState>(
            bloc: addTaskCubit,
            listener: (context, state) {
              if (state.isSuccess) {
                getAllTasksCubit.getTasks();
              }
            },
          ),
          BlocListener<GetAllTasksCubit, BaseState<List<Tasks>?>>(
            bloc: getAllTasksCubit,
            listener: (context, state) {
              if (state.isSuccess) {
                log(state.item?.length.toString() ?? '0');
                log(state.item?.first.id ?? 'test');
                log(state.item?.first.title ?? 'test');
                log(state.item?.first.description ?? 'test');
                log(state.item?.first.status.name ?? 'test');
              }
            },
          ),
          BlocListener<UpdateTaskCubit, BaseState<List<Tasks>?>>(
            bloc: updateTaskCubit,
            listener: (context, state) {},
          ),
          BlocListener<DeleteTaskCubit, BaseState<List<Tasks>?>>(
            bloc: deleteTaskCubit,
            listener: (context, state) {},
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  tr.toDoApp,
                  style: TextStyle(
                    color: Theme.of(context).appColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _TasksCardInfo(
                          containerColor:
                              const Color(0xff46CF8B).withOpacity(0.1),
                          title: tr.completed,
                          data: '0',
                          iconPath: Assets.icons.completed.path),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: _TasksCardInfo(
                          containerColor:
                              const Color(0xff908986).withOpacity(0.1),
                          title: tr.unCompleted,
                          data: '0',
                          iconPath: Assets.icons.unCompleted.path),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      tr.tasks,
                      style: TextStyle(
                        color: Theme.of(context).appColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Assets.images.task.image(height: 200),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      tr.thereIsNoTasksYet,
                      style: TextStyle(
                        color: Theme.of(context).appColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TasksCardInfo extends StatelessWidget {
  const _TasksCardInfo({
    required this.containerColor,
    required this.title,
    required this.data,
    required this.iconPath,
  });
  final Color containerColor;
  final String title;
  final String data;

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            iconPath,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  data,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).appColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).appColors.darkGreyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
