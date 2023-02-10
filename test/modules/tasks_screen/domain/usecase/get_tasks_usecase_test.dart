import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tasks_board/constants/enums/tasks_enums.dart';
import 'package:tasks_board/core/error/error_message.dart';
import 'package:tasks_board/core/error/failures.dart';
import 'package:tasks_board/core/generic_usecase/usecase.dart';
import 'package:tasks_board/modules/tasks_screen/data/model/task_model.dart';
import 'package:tasks_board/modules/tasks_screen/data/repository/tasks_repository_imp.dart';
import 'package:tasks_board/modules/tasks_screen/domain/usecase/get_tasks_usecase.dart';

class MockTasksRepositoryImp extends Mock implements TasksRepositoryImp {}

void main() {
  late MockTasksRepositoryImp? mockTasksRepositoryImp;
  late GetTasksUseCase? getTasksUseCase;

  setUp(() {
    mockTasksRepositoryImp = MockTasksRepositoryImp();
    getTasksUseCase = GetTasksUseCase(mockTasksRepositoryImp!);
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
    "should return tasks model response when calling get tasks",
    () async {
      // Arrange
      when(
        () => mockTasksRepositoryImp!.getTasks(),
      ).thenAnswer((invocation) async => Right(tTasksResponse));
      // Act
      final result = await getTasksUseCase!(NoParams());
      // Assert
      expect(result, Right(tTasksResponse));
      verify(
        () => mockTasksRepositoryImp!.getTasks(),
      );
      verifyNoMoreInteractions(mockTasksRepositoryImp);
    },
  );
  test(
    "should return error calling get tasks",
    () async {
      // Arrange
      when(
        () => mockTasksRepositoryImp!.getTasks(),
      ).thenAnswer((invocation) async => const Left(tErrorResponse));
      // Act
      final result = await getTasksUseCase!(NoParams());
      // Assert
      expect(result, const Left(tErrorResponse));
      verify(
        () => mockTasksRepositoryImp!.getTasks(),
      );
      verifyNoMoreInteractions(mockTasksRepositoryImp);
    },
  );
}
