import 'package:flutter/material.dart';
import 'package:tasks_board/modules/add_task_screen/presentation/UI/add_task_screen.dart';
import 'package:tasks_board/modules/main_screen/presentation/UI/main_screen.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';
import 'package:tasks_board/routes/routes_names.dart';

/// This Function to route manger to all screen ( handle all routing screen)
/// if you need to add a new screen should be add it here in this file.
Route<dynamic> generateRoute(RouteSettings settings) {
  Widget view;
  switch (settings.name) {
    case Routes.base:
      view = const MainScreen();
      break;
    case Routes.addTaskScreen:
      view = AddTaskScreen(
          task: settings.arguments != null
              ? settings.arguments as TaskModel
              : null);
      break;
    default:
      view = const Scaffold(
          body: Center(
        child: Text("Page Not Found"),
      ));
  }
  return MaterialPageRoute(builder: (context) => view, settings: settings);
}
