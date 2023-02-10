// please add your import here if fail try to add here directly

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_board/constants/prefs_keys/prefs_keys.dart';
import 'package:tasks_board/modules/add_task_screen/business_logic/add_task_screen_provider.dart';
import 'package:tasks_board/modules/tasks_screen/business_logic/tasks_screen_provider.dart';

import '../../modules/add_task_screen/data/data_source/add_task_local_data_source_imp.dart';
import '../../modules/add_task_screen/data/repository/add_task_repository_imp.dart';
import '../../modules/add_task_screen/domain/usecase/add_task_usecase.dart';
import '../../modules/tasks_history_screen/business_logic/tasks_history_screen_provider.dart';
import '../../modules/tasks_history_screen/data/data_source/tasks_history_local_data_source_imp.dart';
import '../../modules/tasks_history_screen/data/repository/tasks_history_repository_imp.dart';
import '../../modules/tasks_history_screen/domain/usecase/get_tasks_history_usecase.dart';
import '../../modules/tasks_screen/data/data_source/tasks_local_data_source_imp.dart';
import '../../modules/tasks_screen/data/repository/tasks_repository_imp.dart';
import '../../modules/tasks_screen/domain/usecase/get_tasks_usecase.dart';
import 'singletons_imports.dart';

final getIt = GetIt.instance;

// init request "should be init in main file before run app"
initSingletonInstances() async {
  // Register Core Components like dio client
  await registerCoreComponents();

  // Register Data Sources
  registerDataSources();

  // Register Repositories
  registerRepositoriesImp();

  // Register UseCases
  registerUseCases();

  // Register Providers
  registerProviders();
}

registerDataSources() {
  getIt.registerLazySingleton(() => AddTaskLocalDataSourceImp());
  getIt.registerLazySingleton(() => TasksLocalDataSourceImp());
  getIt.registerLazySingleton(() => TasksHistoryLocalDataSourceImp());
}

registerRepositoriesImp() {
  getIt.registerLazySingleton(() => AddTaskRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => TasksRepositoryImp(getIt()));
  getIt.registerLazySingleton(() => TasksHistoryRepositoryImp(getIt()));
}

registerUseCases() {
  getIt.registerLazySingleton(
      () => AddTaskUseCase(getIt<AddTaskRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetTasksUseCase(getIt<TasksRepositoryImp>()));
  getIt.registerLazySingleton(
      () => GetTasksHistoryUseCase(getIt<TasksHistoryRepositoryImp>()));
}

registerProviders() {
  getIt.registerLazySingleton(() => TasksScreenProvider(getIt()));
  getIt.registerLazySingleton(() => TasksHistoryScreenProvider(getIt()));
  getIt.registerLazySingleton(() => AddTaskScreenProvider(getIt()));
}

registerCoreComponents() async {
  // create and register the shared prefrences object
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (!sharedPreferences.containsKey(PrefsKeys.tasks)) {
    sharedPreferences.setString(PrefsKeys.tasks, TaskModel.toJsonList([]));
  }
  getIt.registerLazySingleton(() => sharedPreferences);
}
