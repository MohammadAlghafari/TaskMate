// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:tasks_board/modules/tasks_screen/domain/entitiy/task_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../repository/tasks_repository.dart';

/// get Tasks useCase to link with instance from repository
///
class GetTasksUseCase extends UseCase<List<TaskEntity>, NoParams> {
  final TasksRepository _tasksRepository;

  GetTasksUseCase(this._tasksRepository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) {
    return _tasksRepository.getTasks();
  }
}
