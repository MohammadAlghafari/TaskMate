import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

/// abstract Add Task local data source class
abstract class AddTaskLocalDataSource {
  /// This function called to add a new task or update an existing task
  /// @return bool to indicate success
  Future<bool> addTask({required TaskModel model});

}
