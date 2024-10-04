import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/dashboard/view/ahVerification.dart';
import 'package:myapp/features/dashboard/view/bhVerfication.dart';
import 'package:myapp/features/dashboard/view/resDashboard.dart';
import 'package:myapp/features/login/view/loginPage.dart';
import 'package:myapp/features/registration/view/registrationPage.dart';
import 'package:myapp/features/dashboard/view/dashboard.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
          initialLocation: RoutesPath.loginPage,
          routes: [
            GoRoute(
              name: RoutesName.login,
              path: RoutesPath.loginPage,
              builder: (context, state) => const LoginPage(),
            ),
            ShellRoute(
              builder: (context, state, child) {
                 return DashboardPage(child: child); // Pass the child to the layout
              },
              routes: [
                GoRoute(
                  name: RoutesName.ahVerfication,
                  path: RoutesPath.ahVerification,
                  builder: (context, state) => const AhVerificationPage(),
                ),
                GoRoute(
                  name: RoutesName.bhVerfication,
                  path: RoutesPath.bhVerification,
                  builder: (context, state) => const BhVerificationPage(),
                ),
                GoRoute(
                  name: RoutesName.resDashboard,
                  path: RoutesPath.resDashboard,
                  builder: (context, state) => const ResDashboard(),
                ),
              ],
            ),
            GoRoute(
              name: RoutesName.registration,
              path: RoutesPath.register,
              builder: (context, state) => const RegistrationPage(),
            ),
          ],
        );
}
