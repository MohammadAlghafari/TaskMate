import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_board/constants/text_styles/text_styles.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import 'package:tasks_board/modules/custom_widgets/task_priority_widget.dart';
import 'package:tasks_board/routes/routes_provider.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/enums/tasks_enums.dart';
import '../../../../../core/utility/utility.dart';
import '../../../../../routes/routes_names.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.task});
  final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingProvider.pushNamed(
            routeName: Routes.addTaskScreen, arguments: task);
      },
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title!,
              style: AppTextStyles.nunitoBold(),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  'Due date: ${task.dueDate}',
                  style: AppTextStyles.nunitoRegular(fontSize: 12),
                ),
                const Spacer(),
                TaskPriorityWidget(
                  priority: taskPrioritesNames[
                      TaskPriorityEnum.values.indexOf(task.priority!)],
                  color: Utility.getPriorityColor(task.priority!),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
