import 'package:go_router/go_router.dart';
import 'package:myapp/features/dashboard/view/dashboard.dart';
import 'package:myapp/features/login/view/loginPage.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

class AppRoutes {
  final GoRouter router;

  AppRoutes()
      : router = GoRouter(
          initialLocation: RoutesPath.loginPage,
          routes: [
            GoRoute(
              name: RoutesName.login,
              path: RoutesPath.loginPage,
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              name: RoutesName.dashboard,
              path: RoutesPath.dashBoardPage,
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        );
}
