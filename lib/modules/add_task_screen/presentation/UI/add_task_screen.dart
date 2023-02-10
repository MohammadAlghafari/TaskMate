import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tasks_board/constants/colors/colors.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/constants/icons/app_icons.dart';
import 'package:tasks_board/constants/text_styles/text_styles.dart';
import 'package:tasks_board/core/extensions/date_extensions.dart';
import 'package:tasks_board/core/utility/custom_validator.dart';
import 'package:tasks_board/core/utility/utility.dart';
import 'package:tasks_board/modules/add_task_screen/business_logic/add_task_screen_provider.dart';
import 'package:tasks_board/modules/add_task_screen/presentation/UI/widgets/multi_choice_bottom_sheet.dart';
import 'package:tasks_board/modules/custom_widgets/custom_button.dart';
import 'package:tasks_board/modules/custom_widgets/custom_progress_indicator.dart';
import 'package:tasks_board/modules/custom_widgets/custom_text_field.dart';
import 'package:tasks_board/modules/tasks_screen/business_logic/tasks_screen_provider.dart';
import 'package:tasks_board/routes/routes_provider.dart';

import '../../../tasks_screen/data/model/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.task});

  final TaskModel? task;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _listController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      _titleController.text = widget.task!.title!;
      _descriptionController.text = widget.task!.description!;
      _listController.text =
          tasksListNames[TasksListEnum.values.indexOf(widget.task!.taskList!)];
      _priorityController.text = taskPrioritesNames[
          TaskPriorityEnum.values.indexOf(widget.task!.priority!)];
      _startDateController.text = widget.task!.startDate!;
      _dueDateController.text = widget.task!.dueDate!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            RoutingProvider.goBack();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.blackColor,
                          )),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            RoutingProvider.goBack();
                          },
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.nunitoBold(
                                color: AppColors.blueColor, fontSize: 14),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    widget.task != null ? 'Edit Task' : 'Create Task',
                    style: AppTextStyles.nunitoBold(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.tagIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Title of task',
                        style: AppTextStyles.nunitoRegular(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    onValid: (value) => CustomValidator.isRequired(value),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.listIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Choose List',
                        style: AppTextStyles.nunitoRegular(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    controller: _listController,
                    onTap: () async {
                      String? selected = await showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColors.transparentColor,
                          isScrollControlled: true,
                          builder: (context) =>
                              MultiChoiceBottomSheet(items: tasksListNames));
                      if (selected != null) {
                        _listController.text = selected;
                      }
                    },
                    enableField: false,
                    suffix: const Icon(Icons.keyboard_arrow_down_sharp),
                    onValid: (value) => CustomValidator.isRequired(value),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.listIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Choose Priority',
                        style: AppTextStyles.nunitoRegular(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    controller: _priorityController,
                    onTap: () async {
                      String? selected = await showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColors.transparentColor,
                          isScrollControlled: true,
                          builder: (context) => MultiChoiceBottomSheet(
                              items: taskPrioritesNames));
                      if (selected != null) {
                        _priorityController.text = selected;
                      }
                    },
                    enableField: false,
                    suffix: const Icon(Icons.keyboard_arrow_down_sharp),
                    onValid: (value) => CustomValidator.isRequired(value),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.descriptionIcon),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Description',
                        style: AppTextStyles.nunitoRegular(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    controller: _descriptionController,
                    textInputAction: TextInputAction.next,
                    minLines: 5,
                    onValid: (value) => CustomValidator.isRequired(value),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.dateIcon),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Start Date',
                                style: AppTextStyles.nunitoRegular(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomTextField(
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 30)));

                              if (date != null) {
                                _startDateController.text = date.ddMMyyyy();
                              }
                            },
                            width: 170.w,
                            enableField: false,
                            controller: _startDateController,
                            textInputAction: TextInputAction.next,
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.dateIcon),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Due Date',
                                style: AppTextStyles.nunitoRegular(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomTextField(
                            onTap: () async {
                              DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 30)));

                              if (date != null) {
                                _dueDateController.text = date.ddMMyyyy();
                              }
                            },
                            width: 170.w,
                            enableField: false,
                            controller: _dueDateController,
                            textInputAction: TextInputAction.done,
                            onValid: (value) =>
                                CustomValidator.isRequired(value),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Consumer<AddTaskScreenProvider>(
                      builder: (context, provider, _) {
                    var tasksProvider = Provider.of<TasksScreenProvider>(
                        context,
                        listen: false);
                    return CustomButton(
                        buttonContent: provider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.blueColor)
                            : Text(
                                widget.task != null
                                    ? 'Edit Task'
                                    : 'Save and Create Task',
                                style: AppTextStyles.nunitoBold(
                                    color: AppColors.blueColor),
                              ),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool success = await provider.addTask(
                                    model: TaskModel(
                                      id: widget.task != null
                                          ? widget.task!.id
                                          : Utility.getCustomUniqueId(),
                                      title: _titleController.text,
                                      description: _descriptionController.text,
                                      startDate: _startDateController.text,
                                      dueDate: _dueDateController.text,
                                      priority: TaskPriorityEnum.values[
                                          taskPrioritesNames.indexOf(
                                              _priorityController.text)],
                                      taskList: TasksListEnum.values[
                                          tasksListNames
                                              .indexOf(_listController.text)],
                                    ),
                                  );
                                  if (success) {
                                    Utility.showToast(
                                        message: widget.task != null
                                            ? 'Task was updated successfully'
                                            : 'Task was created successfully');
                                    RoutingProvider.goBack();
                                    tasksProvider.getTasks();
                                  }
                                }
                              });
                  }),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _listController.dispose();
    _priorityController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }
}
