import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/presentation/utils/generated/translation/translations.dart';
import 'package:to_do_app/home/domain/entities/enums/task_status.dart';
import 'package:to_do_app/home/domain/entities/tasks.dart';
import 'package:to_do_app/home/presentation/cubits/add_task_cubit.dart';
import 'package:to_do_app/home/presentation/cubits/update_task_cubit.dart';
import 'package:to_do_app/home/presentation/widgets/regular_bottom_sheet_layout.dart';

class AddEditBottomSheet extends StatefulWidget {
  const AddEditBottomSheet({
    super.key,
    this.index,
    this.tasks,
    required this.addTaskCubit,
    required this.updateTaskCubit,
  });
  final Tasks? tasks;
  final int? index;
  final AddTaskCubit addTaskCubit;
  final UpdateTaskCubit updateTaskCubit;

  @override
  State<AddEditBottomSheet> createState() => _AddEditBottomSheetState();
}

class _AddEditBottomSheetState extends State<AddEditBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TaskStatus status = TaskStatus.inCompleted;
  @override
  void initState() {
    if (widget.tasks != null) {
      titleController.text = widget.tasks!.title;
      descriptionController.text = widget.tasks!.description;
      status = widget.tasks!.status;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Translations tr = Translations.of(context)!;

    return Form(
      key: _key,
      child: RegularBottomSheetLayout(
        title: widget.tasks != null ? tr.updateTask : tr.addTask,
        onCancel: () => context.pop(),
        onDone: () {
          if (_key.currentState!.validate()) {
            if (widget.tasks != null) {
              widget.updateTaskCubit.updateTask(
                task: Tasks(
                    id: widget.tasks!.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    status: status,
                    createdAt: widget.tasks!.createdAt),
                index: widget.index!,
              );
            } else {
              widget.addTaskCubit.addNewTask(
                task: Tasks(
                  id: 'id',
                  title: titleController.text,
                  description: descriptionController.text,
                  status: status,
                  createdAt: DateTime.now(),
                ),
              );
            }
          }
        },
        doneTxt: widget.tasks != null ? tr.save : tr.confirm,
        showCancelBtn: true,
        showDoneBtn: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormField(
                  controller: titleController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return tr.thisFieldIsRequired;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: tr.enterTitle,
                    labelStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontSize: 16,
                            ),
                  ),
                ),
              ),
              TextFormField(
                controller: descriptionController,
                minLines: 3,
                maxLines: 5,
                validator: (v) {
                  if (v!.isEmpty) {
                    return tr.thisFieldIsRequired;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: tr.enterDescription,
                  labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                tr.taskStatus,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    // fontSize: 16,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              ...TaskStatus.values.map(
                (e) => Row(
                  children: [
                    Radio<TaskStatus>(
                      value: e,
                      groupValue: status,
                      onChanged: (v) {
                        status = v!;
                        setState(() {});
                      },
                    ),
                    Text(
                      e.name,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
