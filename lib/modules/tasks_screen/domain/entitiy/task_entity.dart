// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tasks_board/constants/enums/tasks_enums.dart';

class TaskEntity {
  String? id;
  String? title;
  String? description;
  String? startDate;
  String? dueDate;
  TaskPriorityEnum? priority;
  TasksListEnum? taskList;
  TaskEntity({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.dueDate,
    this.priority,
    this.taskList,
  });
}
