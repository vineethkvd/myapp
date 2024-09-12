import 'package:flutter/material.dart';
import 'package:myapp/features/dashboard/view/ahVerification.dart';
import 'package:myapp/features/dashboard/view/bhVerfication.dart';

class Dashboardcontroller extends ChangeNotifier {
  int selectedIndex = 0;
  Widget currentWidget = const AhVerificationPage(); 

  void changeCurrentWidget(int index) {
    if (index == selectedIndex) return; 
    selectedIndex = index;

    // Update currentWidget based on the selected index
    switch (selectedIndex) {
      case 0:
        currentWidget = const AhVerificationPage();
        break;
      case 1:
        currentWidget = const BhVerificationPage();
        break;
      default:
        currentWidget = const Center(child: Text('Page not found')); // Handle unknown indices
    }

    notifyListeners(); // Notify listeners after updating the widget
  }
}
