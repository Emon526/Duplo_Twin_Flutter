import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'screens/homescreen.dart';
import 'screens/profilescreen.dart';
import 'screens/taskscreen.dart';
import 'screens/teamscreen.dart';
import 'screens/vipscreen.dart';

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
          TaskPage(),
          TeamPage(),
          VipPage(),
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
        icon: Icons.task,
        name: "Task",
      ),
      _buildNavbarItem(
        icon: Icons.groups,
        name: "Team",
      ),
      _buildNavbarItem(
        icon: Icons.diamond,
        name: "VIP",
      ),
      _buildNavbarItem(
        icon: Icons.person,
        name: "Mine",
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
