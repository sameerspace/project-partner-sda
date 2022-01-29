import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            )),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Your Profile",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.person),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                ProfileScreen.routeName,
              );
            },
            tileColor: Colors.amber,
          ),
          ListTile(
            title: const Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.settings),
            onTap: () {},
            tileColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
