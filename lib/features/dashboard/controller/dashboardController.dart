import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/helpers/routes/app_route_name.dart';
import 'package:myapp/features/dashboard/view/ahVerification.dart';
import 'package:myapp/features/dashboard/view/bhVerfication.dart';

class Dashboardcontroller extends ChangeNotifier {
  int selectedIndex = 0;
  Widget currentWidget = const AhVerificationPage();

  void changeCurrentWidget(int index, BuildContext context) {
    if (index == selectedIndex) return;
    selectedIndex = index;

    switch (selectedIndex) {
      case 0:
        currentWidget = const AhVerificationPage();
        GoRouter.of(context).goNamed(RoutesName.ahVerfication);
        break;
      case 1:
        currentWidget = const BhVerificationPage();
        GoRouter.of(context).goNamed(RoutesName.ahVerfication);
        break;
      default:
        currentWidget = const Center(
            child: Text('Page not found')); // Handle unknown indices
    }

    notifyListeners(); // Notify listeners after updating the widget
  }

//drawer controller
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  var drawerTap = true;
  void toggleDrawer() {
    drawerTap = !drawerTap;
    notifyListeners();
  }
}
