import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/exceptions.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/add_task_screen/data/data_source/add_task_local_data_source_imp.dart';
import 'package:tasks_board/modules/add_task_screen/data/repository/add_task_repository_imp.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

class MockAddTaskLocalDataSourceImp extends Mock
    implements AddTaskLocalDataSourceImp {}

void main() {
  late MockAddTaskLocalDataSourceImp? mockAddTaskLocalDataSourceImp;
  late AddTaskRepositoryImp? addTaskRepositoryImp;

  setUp(() {
    mockAddTaskLocalDataSourceImp = MockAddTaskLocalDataSourceImp();
    addTaskRepositoryImp = AddTaskRepositoryImp(mockAddTaskLocalDataSourceImp!);
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
      when(() => mockAddTaskLocalDataSourceImp!.addTask(model: tTaskModel))
          .thenAnswer((_) async => tSuccessResponse);
      // Act
      final result = await addTaskRepositoryImp!.addTask(model: tTaskModel);
      // Assert
      expect(result, const Right(tSuccessResponse));
      verify(() => mockAddTaskLocalDataSourceImp!.addTask(model: tTaskModel));
      verifyNoMoreInteractions(mockAddTaskLocalDataSourceImp);
    },
  );
  test(
    "add task should return error form add task func",
    () async {
      // Arrange
      when(() => mockAddTaskLocalDataSourceImp!.addTask(model: tTaskModel))
          .thenThrow(const CacheException(message: ErrorMessages.nDefault));
      // Act
      final result = await addTaskRepositoryImp!.addTask(model: tTaskModel);
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(() => mockAddTaskLocalDataSourceImp!.addTask(model: tTaskModel));
      verifyNoMoreInteractions(mockAddTaskLocalDataSourceImp);
    },
  );
}
