// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../tasks_screen/data/model/task_model.dart';
import '../repository/add_task_repository.dart';

/// Add Task useCase to link with instance from repository
///
class AddTaskUseCase extends UseCase<bool, AddTaskUseCaseParams> {
  final AddTaskRepository _addTaskRepository;

  AddTaskUseCase(this._addTaskRepository);

  @override
  Future<Either<Failure, bool>> call(AddTaskUseCaseParams params) {
    return _addTaskRepository.addTask(model: params.model);
  }
}

class AddTaskUseCaseParams {
  final TaskModel model;
  AddTaskUseCaseParams({
    required this.model,
  });
}
