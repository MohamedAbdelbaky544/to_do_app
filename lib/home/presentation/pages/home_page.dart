import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
import 'package:to_do_app/home/presentation/widgets/add_edit_bottom_sheet.dart';
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
  int inCompleted = 0;

  @override
  void initState() {
    getAllTasksCubit.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Translations tr = Translations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.8,
              minHeight: MediaQuery.sizeOf(context).height * 0.7,
            ),
            context: context,
            builder: (context) => AddEditBottomSheet(
              updateTaskCubit: updateTaskCubit,
              addTaskCubit: addTaskCubit,
            ),
          );
        },
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
                context.pop();
                getAllTasksCubit.getTasks();
              }
            },
          ),
          BlocListener<GetAllTasksCubit, BaseState<List<Tasks>?>>(
            bloc: getAllTasksCubit,
            listener: (context, state) {
              if (state.isSuccess) {
                completed = inCompleted = 0;
                for (var item in state.item ?? []) {
                  if (item.status == TaskStatus.completed) {
                    completed += 1;
                  } else {
                    inCompleted += 1;
                  }
                }
                setState(() {});
              }
            },
          ),
          BlocListener<UpdateTaskCubit, BaseState<int>>(
            bloc: updateTaskCubit,
            listener: (context, state) {
              if (state.isSuccess) {
                context.pop();
                getAllTasksCubit.getTasks();
              }
            },
          ),
          BlocListener<DeleteTaskCubit, BaseState<int>>(
            bloc: deleteTaskCubit,
            listener: (context, state) {
              if (state.isSuccess) {
                getAllTasksCubit.getTasks();
              }
            },
          ),
        ],
        child: BlocBuilder<GetAllTasksCubit, BaseState<List<Tasks>?>>(
          bloc: getAllTasksCubit,
          builder: (context, state) => SafeArea(
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
                            data: completed.toString(),
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
                            data: inCompleted.toString(),
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
                  (state.item == null || state.item!.isEmpty)
                      ? Column(
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
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.item?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .appColors
                                            .whiteColor,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .appColors
                                                .grey)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Tooltip(
                                                message:
                                                    state.item![index].title,
                                                child: Text(
                                                  state.item![index].title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .appColors
                                                        .blackColor,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: statusTextColor(state
                                                            .item![index]
                                                            .status)
                                                        .withOpacity(0.1),
                                                  ),
                                                  child: Text(
                                                    state.item![index].status
                                                        .name,
                                                    style: TextStyle(
                                                      color: statusTextColor(
                                                          state.item![index]
                                                              .status),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    customButton: Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Theme.of(context)
                                                            .appColors
                                                            .greyColorForBorder,
                                                      ),
                                                      child: Icon(
                                                        Icons.more_vert_rounded,
                                                        size: 22,
                                                        color: Theme.of(context)
                                                            .appColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    buttonStyleData:
                                                        ButtonStyleData(
                                                      overlayColor:
                                                          WidgetStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                    ),
                                                    items: [
                                                      DropdownMenuItem<int>(
                                                        value: 1,
                                                        child: Text(tr.edit,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!),
                                                      ),
                                                      DropdownMenuItem<int>(
                                                        value: 2,
                                                        child: Text(
                                                          tr.delete,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .appColors
                                                                        .errorColor,
                                                                  ),
                                                        ),
                                                      ),
                                                    ],
                                                    dropdownStyleData:
                                                        DropdownStyleData(
                                                            width: 100,
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 6),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Theme.of(
                                                                      context)
                                                                  .appColors
                                                                  .whiteColor,
                                                            ),
                                                            elevation: 3,
                                                            offset:
                                                                const Offset(
                                                                    -90, -4),
                                                            isOverButton:
                                                                false),
                                                    onChanged: (num) {
                                                      if (num == 1) {
                                                        showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxHeight: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.8,
                                                            minHeight: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.7,
                                                          ),
                                                          context: context,
                                                          builder: (context) =>
                                                              AddEditBottomSheet(
                                                            tasks: state
                                                                .item![index],
                                                            index: index,
                                                            updateTaskCubit:
                                                                updateTaskCubit,
                                                            addTaskCubit:
                                                                addTaskCubit,
                                                          ),
                                                        );
                                                      } else if (num == 2) {
                                                        deleteTaskCubit
                                                            .deleteTask(
                                                          index: index,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.item![index].description,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .appColors
                                                .darkGreyColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
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
            mainAxisAlignment: MainAxisAlignment.center,
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
