import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasks_board/modules/custom_widgets/custom_progress_indicator.dart';
import 'package:tasks_board/modules/tasks_history_screen/business_logic/tasks_history_screen_provider.dart';
import 'package:tasks_board/modules/tasks_history_screen/presentation/UI/widgets/task_history_item_widget.dart';

import '../../../../constants/colors/colors.dart';
import '../../../../constants/text_styles/text_styles.dart';

class TasksHistoryScreen extends StatefulWidget {
  const TasksHistoryScreen({super.key});

  @override
  State<TasksHistoryScreen> createState() => _TasksHistoryScreenState();
}

class _TasksHistoryScreenState extends State<TasksHistoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TasksHistoryScreenProvider>(context, listen: false)
          .getTasksHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Consumer<TasksHistoryScreenProvider>(
              builder: (context, provider, _) {
            if (provider.isLoading) {
              return const CustomProgressIndicator(color: AppColors.blueColor);
            } else if (provider.tasks.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'History',
                    style: AppTextStyles.nunitoBold(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemBuilder: (context, index) =>
                          TaskHistoryItemWidget(task: provider.tasks[index]),
                      itemCount: provider.tasks.length,
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(
                  'No Tasks Completed',
                  style: AppTextStyles.nunitoBold(
                      fontSize: 20, color: AppColors.blueColor),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
