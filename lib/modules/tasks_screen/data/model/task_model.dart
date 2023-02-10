// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import '../../../../constants/enums/tasks_enums.dart';
import '../../domain/entitiy/task_entity.dart';


class TaskModel extends TaskEntity {
  TaskModel({
     String? id,
     String? title,
     String? description,
    String? startDate,
     String? dueDate,
     TaskPriorityEnum? priority,
     TasksListEnum? taskList,
  }) : super(
            id: id,
            title: title,
            description: description,
            startDate: startDate,
            dueDate: dueDate,
            priority: priority,
            taskList: taskList);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate,
      'dueDate': dueDate,
      'priority': TaskPriorityEnum.values.indexOf(priority!),
      'taskList': TasksListEnum.values.indexOf(taskList!),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as String : null,
      priority: map['priority'] != null
          ? TaskPriorityEnum.values[map['priority']]
          : null,
      taskList: map['taskList'] != null
          ? TasksListEnum.values[map['taskList']]
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

      static String toJsonList(List<TaskModel> tasks) => json.encode(
        tasks
            .map<Map<String, dynamic>>((address) => address.toMap())
            .toList(),
      );

  static List<TaskModel> fromJsonList(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<TaskModel>((item) => TaskModel.fromMap(item))
          .toList();
}
