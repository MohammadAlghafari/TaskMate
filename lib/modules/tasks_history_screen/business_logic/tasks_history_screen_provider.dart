import '../../../core/base_providers/base_provider.dart';
import '../../../core/generic_usecase/usecase.dart';
import '../../../core/utility/utility.dart';
import '../../tasks_screen/domain/entitiy/task_entity.dart';
import '../domain/usecase/get_tasks_history_usecase.dart';

class TasksHistoryScreenProvider extends BaseProvider {
  final GetTasksHistoryUseCase _getTasksHistoryUseCase;
  TasksHistoryScreenProvider(this._getTasksHistoryUseCase);

  List<TaskEntity> _tasks = [];
  List<TaskEntity> get tasks => _tasks;

  // get Tasks function to get tasks history
  Future<bool> getTasksHistory() async {
    setLoading = true;
    update();
    var tasksResult = await _getTasksHistoryUseCase(NoParams());
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
