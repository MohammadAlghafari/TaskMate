import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

/// abstract Tasks local data source class
abstract class TasksLocalDataSource {
  /// This function called to fetch all tasks
  /// @return List of Task Model to indicate success
  Future<List<TaskModel>> getTasks();

}
