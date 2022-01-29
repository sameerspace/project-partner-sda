import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/home_page.dart';

class ProjectNavBar extends StatefulWidget {
  const ProjectNavBar({Key? key}) : super(key: key);

  @override
  _ProjectNavBarState createState() => _ProjectNavBarState();
}

class _ProjectNavBarState extends State<ProjectNavBar> {
  int _currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed(HomePageScreen.routeName);
    }
    if (index == 2) {
      Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'People',
        ),
      ],
      selectedItemColor: Colors.amber,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: updateIndex,
    );
  }
}
