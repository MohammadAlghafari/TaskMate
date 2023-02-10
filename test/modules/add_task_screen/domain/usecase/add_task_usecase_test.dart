import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/add_task_screen/data/repository/add_task_repository_imp.dart';
import 'package:tasks_board/modules/add_task_screen/domain/usecase/add_task_usecase.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

class MockAddTaskRepositoryImp extends Mock implements AddTaskRepositoryImp {}

void main() {
  late MockAddTaskRepositoryImp? mockAddTaskRepositoryImp;
  late AddTaskUseCase? addTaskUsecase;

  setUp(() {
    mockAddTaskRepositoryImp = MockAddTaskRepositoryImp();
    addTaskUsecase = AddTaskUseCase(mockAddTaskRepositoryImp!);
  });

  TaskModel tTaskModel = TaskModel(
    id: 'id',
    title: 'title',
    description: 'description',
    startDate: '2/2/2023',
    dueDate: '3/2/2023',
    taskList: TasksListEnum.tasksToDo,
    priority: TaskPriorityEnum.lowPriority,
  );

  const tSuccessResponse = true;

  const tErrorResponse = CacheFailure(message: ErrorMessages.nDefault);

  test(
    "add task should return true success",
    () async {
      // Arrange
      when(() => mockAddTaskRepositoryImp!.addTask(model: tTaskModel))
          .thenAnswer((_) async => const Right(tSuccessResponse));
      // Act
      final result =
          await addTaskUsecase!(AddTaskUseCaseParams(model: tTaskModel));
      // Assert
      expect(result, const Right(tSuccessResponse));
      verify(() => mockAddTaskRepositoryImp!.addTask(model: tTaskModel));
      verifyNoMoreInteractions(mockAddTaskRepositoryImp);
    },
  );
  test(
    "add task should return error form add task func",
    () async {
      // Arrange
      when(() => mockAddTaskRepositoryImp!.addTask(model: tTaskModel))
          .thenAnswer( (invocation) async => const Left(tErrorResponse));
      // Act
      final result =
          await addTaskUsecase!(AddTaskUseCaseParams(model: tTaskModel));
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(() => mockAddTaskRepositoryImp!.addTask(model: tTaskModel));
      verifyNoMoreInteractions(mockAddTaskRepositoryImp);
    },
  );
}
