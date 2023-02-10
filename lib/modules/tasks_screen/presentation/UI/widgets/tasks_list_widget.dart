import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_board/constants/colors/colors.dart';
import 'package:tasks_board/constants/text_styles/text_styles.dart';
import 'package:tasks_board/modules/tasks_screen/presentation/UI/widgets/task_item_widget.dart';

import '../../../domain/entitiy/task_entity.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget(
      {super.key, required this.listName, required this.tasks});
  final String listName;
  final List<TaskEntity> tasks;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 270.w, maxHeight: 500.h),
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(children: [
          Row(
            children: [
              Text(
                listName,
                style: AppTextStyles.nunitoBold(),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: AppColors.blackColor,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) =>
                  TaskItemWidget(task: tasks[index]),
              itemCount: tasks.length,
            ),
          )
        ]),
      ),
    );
  }
}
