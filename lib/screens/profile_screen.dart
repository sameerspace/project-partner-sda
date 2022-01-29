import 'package:flutter/material.dart';
import 'package:projectpartner/widgets/bottom_bar.dart';
import '../widgets/user_tile.dart';
import '../widgets/side_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile-screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.purple, Colors.deepPurple],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const SideDrawer(),
        appBar: AppBar(
          title: const Text("Project Partner"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final users = snapshot.data!.docs;
            return ListView.builder(
              itemBuilder: (context, index) => UserTile(
                name: users[index]['name'],
                image: users[index]['image'],
                department: users[index]['department'],
              ),
              itemCount: users.length,
            );
          },
        ),
        bottomNavigationBar: const ProjectNavBar(),
      ),
    );
  }
}
