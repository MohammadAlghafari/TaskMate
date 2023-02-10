import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../tasks_screen/data/model/task_model.dart';

// abstract class for Add Task Repository
abstract class AddTaskRepository {
  /// This function called to add  a new task or update an exsiting one
  /// @Params 1. Task Entity [required]
  /// @return bool to indicate success
  Future<Either<Failure, bool>> addTask({required TaskModel model});
}
