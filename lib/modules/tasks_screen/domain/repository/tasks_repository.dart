import 'package:dartz/dartz.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';
import '../../../../../core/error/failures.dart';

// abstract class for Tasks Repository
abstract class TasksRepository {
  /// This function called to fetch all tasks
  /// @return List of Task Entity to indicate success
  Future<Either<Failure, List<TaskEntity>>> getTasks();
}
