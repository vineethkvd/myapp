import 'package:flutter/material.dart';
import 'package:myapp/core/helpers/routes/app_route_config.dart';
import 'package:myapp/features/dashboard/controller/dashboardController.dart';
import 'package:myapp/features/login/controller/LoginController.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRouter = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Dashboardcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.router.routerDelegate,
          routeInformationParser: _appRouter.router.routeInformationParser,
          routeInformationProvider: _appRouter.router.routeInformationProvider,
        );
      },
    );
  }
}
