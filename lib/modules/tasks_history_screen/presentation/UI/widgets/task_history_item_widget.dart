import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/text_styles/text_styles.dart';
import '../../../../custom_widgets/task_priority_widget.dart';
import '../../../../tasks_screen/domain/entitiy/task_entity.dart';

class TaskHistoryItemWidget extends StatelessWidget {
  const TaskHistoryItemWidget({super.key, required this.task});
  final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title!,
                  style: AppTextStyles.nunitoBold(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Due date: ${task.dueDate}',
                  style: AppTextStyles.nunitoRegular(fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            const TaskPriorityWidget(priority: 'Done', color: AppColors.greenColor)
          ],
        ),
      );
  }
}