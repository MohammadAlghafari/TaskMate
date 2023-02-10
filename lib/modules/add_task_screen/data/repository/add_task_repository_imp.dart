import 'package:dartz/dartz.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';
import 'package:tasks_board/core/error/failures.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/add_task_repository.dart';
import '../data_source/add_task_local_data_source_imp.dart';

// implementation for Add Task repository
class AddTaskRepositoryImp implements AddTaskRepository {
  final AddTaskLocalDataSourceImp _dataSourceImp;

  AddTaskRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, bool>> addTask({required TaskModel model}) {
    return RepoRemoteDataSourceHandler.repoDataSourceHandler(
        () => _dataSourceImp.addTask(model: model));
  }
}
