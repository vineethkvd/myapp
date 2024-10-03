import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/routes/app_route_path.dart';

class TestDashboardcontroller extends ChangeNotifier {
  final GoRouter router;
  int selectedIndex = 0;

  TestDashboardcontroller(this.router);

  void changeCurrentWidget(int index) {
    if (index == selectedIndex) return;

    selectedIndex = index;
    final path = index == 0 ? RoutesPath.ahVerification : RoutesPath.bhVerification;

    router.go('/${RoutesPath.dashBoardPage}/$path');
  }
}


  //GoRouter.of(context).goNamed(RoutesName.bhVerfication);
