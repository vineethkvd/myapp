import 'package:flutter/material.dart';
import 'package:myapp/core/utils/configs/styles/colors.dart';
import 'package:myapp/features/dashboard/controller/dashboardController.dart';
import 'package:provider/provider.dart';

class ResDashboard extends StatefulWidget {
  const ResDashboard({super.key});

  @override
  State<ResDashboard> createState() => _ResDashboardState();
}

class _ResDashboardState extends State<ResDashboard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final dashboardController = Provider.of<Dashboardcontroller>(context);

    return Scaffold(
      body: Row(
        children: [
          // Drawer
          Container(
            width: dashboardController.drawerTap ? 0.2 * w : 0.4 * w,
            height: h,
            color: AppColor.appBarColor, // Set the drawer color
            child: Column(
              children: [
                // Profile Section
                const DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://example.com/profile.jpg'), // Change to a valid image URL
                      ),
                      SizedBox(height: 10),
                      Text('User Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                // Navigation Items
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    // Navigate to Home
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to Settings
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {
                    // Navigate to About
                  },
                ),
                // Logout Button
                const Spacer(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle logout
                  },
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Stack(
              children: [
                const Center(
                  child: Text(
                      'Main Content Here'), // Placeholder for your main content
                ),
                // Hand icon
                Positioned(
                  top: 20,
                  left: 20,
                  child: InkWell(
                    onTap: () {
                      dashboardController.toggleDrawer();
                    },
                    child: const Icon(Icons.back_hand_outlined,
                        color: Colors.black, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//https://www.figma.com/design/HqOPN17Ulnh6il2hWIDkLX/Home-HRMS?node-id=0-1&node-type=canvas&t=gRVlQsXMdIlcBj8G-0
