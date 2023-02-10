import 'package:tasks_board/core/generic_usecase/usecase.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import 'package:tasks_board/modules/tasks_screen/domain/usecase/get_tasks_usecase.dart';

import '../../../core/base_providers/base_provider.dart';
import '../../../core/utility/utility.dart';

class TasksScreenProvider extends BaseProvider {
  final GetTasksUseCase _getTasksUseCase;
  TasksScreenProvider(this._getTasksUseCase);

  List<TaskEntity> _tasks = [];
  List<TaskEntity> get tasks => _tasks;

  // get Tasks function to get all tasks
  Future<bool> getTasks() async {
    setLoading = true;
    update();
    var tasksResult = await _getTasksUseCase(NoParams());
    return tasksResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      _tasks = response;
      update();
      return true;
    });
  }
}
