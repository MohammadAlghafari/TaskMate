import 'package:tasks_board/modules/add_task_screen/domain/usecase/add_task_usecase.dart';

import '../../../core/base_providers/base_provider.dart';
import '../../../core/utility/utility.dart';
import '../../tasks_screen/data/model/task_model.dart';

class AddTaskScreenProvider extends BaseProvider {
  final AddTaskUseCase _addTaskUseCase;

  AddTaskScreenProvider(this._addTaskUseCase);

  // Add Task function to add or update a task
  Future<bool> addTask({required TaskModel model}) async {
    setLoading = true;
    update();
    var addTaskResult =
        await _addTaskUseCase(AddTaskUseCaseParams(model: model));
    return addTaskResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.props.first.toString());
      update();
      return false;
    }, (response) {
      setLoading = false;
      update();
      return true;
    });
  }
}
