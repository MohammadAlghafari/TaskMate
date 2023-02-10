import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_board/constants/text_styles/text_styles.dart';

import '../../constants/colors/colors.dart';

class TaskPriorityWidget extends StatelessWidget {
  const TaskPriorityWidget({super.key, required this.priority, required this.color});
  final String priority;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        priority,
        style:
            AppTextStyles.nunitoBold(color: AppColors.whiteColor, fontSize: 10),
      ),
    );
  }
}
