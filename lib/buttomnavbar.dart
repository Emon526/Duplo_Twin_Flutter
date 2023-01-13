import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'screens/home/homescreen.dart';
import 'screens/profile/profilescreen.dart';
import 'screens/raferral/refferscreen.dart';
import 'screens/packages/packagesscreen.dart';
import 'screens/notification/notificationscreen.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({Key? key}) : super(key: key);

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          HomePage(),
          RefferPage(),
          PackagesPage(),
          NotificationPage(),
          ProfilePage(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style6,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor!,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavbarItem(
        icon: Icons.home,
        name: "Home",
      ),
      _buildNavbarItem(
        icon: Icons.groups,
        name: "Raferral",
      ),
      _buildNavbarItem(
        icon: Icons.hub,
        name: "Packages",
      ),
      _buildNavbarItem(
        icon: Icons.email,
        name: "Notifications",
      ),
      _buildNavbarItem(
        icon: Icons.person,
        name: "Profile",
      ),
    ];
  }

  _buildNavbarItem({
    required String name,
    required IconData icon,
  }) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: name,
      activeColorPrimary: Theme.of(context).primaryColor,
      inactiveColorPrimary: Colors.grey.shade600,
    );
  }
}
