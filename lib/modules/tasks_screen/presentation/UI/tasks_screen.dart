import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tasks_board/constants/colors/colors.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/constants/icons/app_icons.dart';
import 'package:tasks_board/constants/images/app_images.dart';
import 'package:tasks_board/constants/text_styles/text_styles.dart';
import 'package:tasks_board/modules/custom_widgets/custom_button.dart';
import 'package:tasks_board/modules/custom_widgets/custom_progress_indicator.dart';
import 'package:tasks_board/modules/tasks_screen/business_logic/tasks_screen_provider.dart';
import 'package:tasks_board/modules/tasks_screen/presentation/UI/widgets/tasks_list_widget.dart';
import 'package:tasks_board/routes/routes_names.dart';
import 'package:tasks_board/routes/routes_provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TasksScreenProvider>(context, listen: false).getTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.userImage,
                    width: 52.r,
                    height: 52.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text('Hello Syra!', style: AppTextStyles.nunitoBold()),
                  const Spacer(),
                  SvgPicture.asset(
                    AppIcons.filterIcon,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text('Tasks Board', style: AppTextStyles.nunitoBold()),
              Text('Create and complete tasks using boards',
                  style: AppTextStyles.nunitoRegular()),
              SizedBox(
                height: 17.h,
              ),
              CustomButton(
                  height: 35,
                  buttonContent: Text(
                    '+ Create task',
                    style:
                        AppTextStyles.nunitoRegular(color: AppColors.blueColor),
                  ),
                  onPressed: () {
                    RoutingProvider.pushNamed(routeName: Routes.addTaskScreen);
                  }),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 30.w),
          child: SizedBox(
            height: 500.h,
            child:
                Consumer<TasksScreenProvider>(builder: (context, provider, _) {
              if (provider.isLoading) {
                return const CustomProgressIndicator(
                    color: AppColors.blueColor);
              } else if (provider.tasks.isNotEmpty) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.w,
                  ),
                  itemBuilder: (context, index) => TasksListWidget(
                      listName: tasksListNames[index],
                      tasks: provider.tasks
                          .where((element) =>
                              TasksListEnum.values.indexOf(element.taskList!) ==
                              index)
                          .toList()),
                  itemCount: TasksListEnum.values.length,
                );
              } else {
                return Center(
                  child: Text(
                    'No Tasks Created',
                    style: AppTextStyles.nunitoBold(  
                        fontSize: 20, color: AppColors.blueColor),
                  ),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
