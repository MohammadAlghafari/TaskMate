import 'package:dartz/dartz.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import '../../../../../core/error/failure_error_handler.dart';
import '../../domain/repository/tasks_repository.dart';
import '../data_source/tasks_local_data_source_imp.dart';

// implementation for Tasks repository
class TasksRepositoryImp implements TasksRepository {
  final TasksLocalDataSourceImp _dataSourceImp;

  TasksRepositoryImp(this._dataSourceImp);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() {
    return RepoRemoteDataSourceHandler.repoDataSourceHandler(
        () => _dataSourceImp.getTasks());
  }
}
