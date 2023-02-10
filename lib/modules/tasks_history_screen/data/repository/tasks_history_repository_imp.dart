import 'package:dartz/dartz.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/tasks_history_repository.dart';
import '../data_source/tasks_history_local_data_source_imp.dart';

// implementation for Tasks history repository
class TasksHistoryRepositoryImp implements TasksHistoryRepository {
  final TasksHistoryLocalDataSourceImp _dataSourceImp;

  TasksHistoryRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksHistory() {
    return RepoRemoteDataSourceHandler.repoDataSourceHandler(
        () => _dataSourceImp.getTasksHistory());
  }
}
