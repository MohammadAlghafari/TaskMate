import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/exceptions.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/modules/tasks_history_screen/data/data_source/tasks_history_local_data_source_imp.dart';
import 'package:tasks_board/modules/tasks_history_screen/data/repository/tasks_history_repository_imp.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

class MockTasksHistoryLocalDataSourceImp extends Mock
    implements TasksHistoryLocalDataSourceImp {}

void main() {
  late MockTasksHistoryLocalDataSourceImp? mockTasksHistoryLocalDataSourceImp;
  late TasksHistoryRepositoryImp? tasksHistoryRepositoryImp;

  setUp(() {
    mockTasksHistoryLocalDataSourceImp = MockTasksHistoryLocalDataSourceImp();
    tasksHistoryRepositoryImp =
        TasksHistoryRepositoryImp(mockTasksHistoryLocalDataSourceImp!);
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
    "get tasks history should return tasks responsemodel",
    () async {
      // Arrange
      when(() => mockTasksHistoryLocalDataSourceImp!.getTasksHistory())
          .thenAnswer((_) async => tTasksResponse);
      // Act
      final result = await tasksHistoryRepositoryImp!.getTasksHistory();
      // Assert
      expect(result, Right(tTasksResponse));
      verify(() => mockTasksHistoryLocalDataSourceImp!.getTasksHistory());
      verifyNoMoreInteractions(mockTasksHistoryLocalDataSourceImp);
    },
  );
  test(
    "get tasks should return error form get tasks history",
    () async {
      // Arrange
      when(() => mockTasksHistoryLocalDataSourceImp!.getTasksHistory())
          .thenThrow(const CacheException(message: ErrorMessages.nDefault));
      // Act
      final result = await tasksHistoryRepositoryImp!.getTasksHistory();
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(() => mockTasksHistoryLocalDataSourceImp!.getTasksHistory());
      verifyNoMoreInteractions(mockTasksHistoryLocalDataSourceImp);
    },
  );
}
