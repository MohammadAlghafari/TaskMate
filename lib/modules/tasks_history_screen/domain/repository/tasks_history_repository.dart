import 'package:dartz/dartz.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import '../../../../../core/error/failures.dart';

// abstract class for Tasks history Repository
abstract class TasksHistoryRepository {
  /// This function called to fetch tasks history
  /// @return List of Task Entity to indicate success
  Future<Either<Failure, List<TaskEntity>>> getTasksHistory();
}
