import 'package:tasks_board/modules/tasks_screen/data/data_source/tasks_local_data_source.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

import '../../../../constants/prefs_keys/prefs_keys.dart';
import '../../../../core/base_providers/base_local_storage_provider.dart';

class TasksLocalDataSourceImp extends BaseLocalStorageProvider
    implements TasksLocalDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks =
        TaskModel.fromJsonList(sharedPrefrences.getString(PrefsKeys.tasks)!);
    return tasks.toList();
  }
}
