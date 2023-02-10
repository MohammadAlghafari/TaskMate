import 'package:tasks_board/constants/prefs_keys/prefs_keys.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

import '../../../../core/base_providers/base_local_storage_provider.dart';
import 'add_task_local_data_source.dart';

class AddTaskLocalDataSourceImp extends BaseLocalStorageProvider
    implements AddTaskLocalDataSource {
  @override
  Future<bool> addTask({required TaskModel model}) async {
    List<TaskModel> tasks =
        TaskModel.fromJsonList(sharedPrefrences.getString(PrefsKeys.tasks)!);
    if (tasks.contains(model)) {
      tasks.firstWhere((element) => element.id == model.id)
        ..title = model.title
        ..description = model.description
        ..startDate = model.startDate
        ..dueDate = model.dueDate
        ..priority = model.priority
        ..taskList = model.taskList;
      sharedPrefrences.setString(PrefsKeys.tasks, TaskModel.toJsonList(tasks));
    } else {
      tasks.add(model);
      sharedPrefrences.setString(PrefsKeys.tasks, TaskModel.toJsonList(tasks));
    }
    return true;
  }
}
