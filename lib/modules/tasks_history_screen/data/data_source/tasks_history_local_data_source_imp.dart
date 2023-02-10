import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/modules/tasks_history_screen/data/data_source/tasks_history_local_data_source.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

import '../../../../constants/prefs_keys/prefs_keys.dart';
import '../../../../core/base_providers/base_local_storage_provider.dart';

class TasksHistoryLocalDataSourceImp extends BaseLocalStorageProvider
    implements TasksHistoryLocalDataSource {
  @override
  Future<List<TaskModel>> getTasksHistory() async {
    List<TaskModel> tasks =
        TaskModel.fromJsonList(sharedPrefrences.getString(PrefsKeys.tasks)!);
    return tasks
        .where((element) => element.taskList == TasksListEnum.tasksDone)
        .toList();
  }
}
