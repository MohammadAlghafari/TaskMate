import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/exceptions.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/tasks_screen/data/data_source/tasks_local_data_source_imp.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';
import 'package:tasks_board/modules/tasks_screen/data/repository/tasks_repository_imp.dart';

class MockTasksLocalDataSourceImp extends Mock
    implements TasksLocalDataSourceImp {}

void main() {
  late MockTasksLocalDataSourceImp? mockTasksLocalDataSourceImp;
  late TasksRepositoryImp? tasksRepositoryImp;

  setUp(() {
    mockTasksLocalDataSourceImp = MockTasksLocalDataSourceImp();
    tasksRepositoryImp = TasksRepositoryImp(mockTasksLocalDataSourceImp!);
  });

  final tTasksResponse = [
    TaskModel(
      id: 'id',
      title: 'title',
      description: 'description',
      startDate: '2/2/2023',
      dueDate: '3/2/2023',
      taskList: TasksListEnum.tasksToDo,
      priority: TaskPriorityEnum.lowPriority,
    )
  ];

  const tErrorResponse = CacheFailure(message: ErrorMessages.nDefault);

  test(
    "get tasks should return tasks responsemodel",
    () async {
      // Arrange
      when(() => mockTasksLocalDataSourceImp!.getTasks())
          .thenAnswer((_) async => tTasksResponse);
      // Act
      final result = await tasksRepositoryImp!.getTasks();
      // Assert
      expect(result, Right(tTasksResponse));
      verify(() => mockTasksLocalDataSourceImp!.getTasks());
      verifyNoMoreInteractions(mockTasksLocalDataSourceImp);
    },
  );
  test(
    "get tasks should return error form get tasks",
    () async {
      // Arrange
      when(() => mockTasksLocalDataSourceImp!.getTasks())
          .thenThrow(const CacheException(message: ErrorMessages.nDefault));
      // Act
      final result = await tasksRepositoryImp!.getTasks();
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(() => mockTasksLocalDataSourceImp!.getTasks());
      verifyNoMoreInteractions(mockTasksLocalDataSourceImp);
    },
  );
}
