import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/core/generic_usecase/usecase.dart';
import 'package:tasks_board/modules/tasks_history_screen/data/repository/tasks_history_repository_imp.dart';
import 'package:tasks_board/modules/tasks_history_screen/domain/usecase/get_tasks_history_usecase.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';

class MockTasksHistoryRepositoryImp extends Mock implements TasksHistoryRepositoryImp {}

void main() {
  late MockTasksHistoryRepositoryImp? mockTasksHistoryRepositoryImp;
  late GetTasksHistoryUseCase? getTasksHistoryUseCase;

  setUp(() {
    mockTasksHistoryRepositoryImp = MockTasksHistoryRepositoryImp();
    getTasksHistoryUseCase = GetTasksHistoryUseCase(mockTasksHistoryRepositoryImp!);
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
    "should return tasks model response when calling get tasks History",
    () async {
      // Arrange
      when(
        () => mockTasksHistoryRepositoryImp!.getTasksHistory(),
      ).thenAnswer((invocation) async => Right(tTasksResponse));
      // Act
      final result = await getTasksHistoryUseCase!(NoParams());
      // Assert
      expect(result, Right(tTasksResponse));
      verify(
        () => mockTasksHistoryRepositoryImp!.getTasksHistory(),
      );
      verifyNoMoreInteractions(mockTasksHistoryRepositoryImp);
    },
  );
  test(
    "should return error calling get tasks History",
    () async {
      // Arrange
      when(
        () => mockTasksHistoryRepositoryImp!.getTasksHistory(),
      ).thenAnswer((invocation) async => const Left(tErrorResponse));
      // Act
      final result = await getTasksHistoryUseCase!(NoParams());
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(
        () => mockTasksHistoryRepositoryImp!.getTasksHistory(),
      );
      verifyNoMoreInteractions(mockTasksHistoryRepositoryImp);
    },
  );
}
