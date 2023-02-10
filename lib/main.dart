import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasks_board/constants/themes/app_themes.dart';
import 'package:tasks_board/modules/tasks_history_screen/business_logic/tasks_history_screen_provider.dart';
import 'package:tasks_board/modules/tasks_screen/business_logic/tasks_screen_provider.dart';
import 'package:tasks_board/routes/router.dart';
import 'package:tasks_board/routes/routes_provider.dart';

import 'core/singletons/singletons.dart';
import 'modules/add_task_screen/business_logic/add_task_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletonInstances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => getIt<TasksScreenProvider>()),
              ChangeNotifierProvider(
                  create: (context) => getIt<AddTaskScreenProvider>()),
              ChangeNotifierProvider(
                  create: (context) => getIt<TasksHistoryScreenProvider>()),
            ],
            child: MaterialApp(
              title: 'Tasks Board',
              debugShowCheckedModeBanner: false,
              navigatorKey: RoutingProvider.navigatorKey,
              theme: AppThemes.appTheme,
              onGenerateRoute: (settings) => generateRoute(settings),
            ),
          );
        });
  }
}
