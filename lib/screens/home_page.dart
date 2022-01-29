import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/project_card.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/side_drawer.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomePageScreen({Key? key}) : super(key: key);
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
          title: const Text('Project Partner'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('projects').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error !"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ProjectCard(
                    mytitle: snapshot.data!.docs[index]['title'],
                    description: snapshot.data!.docs[index]['description'],
                    imageUrl: snapshot.data!.docs[index]['image'],
                    projectId: snapshot.data!.docs[index].id,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }),
        bottomNavigationBar: const ProjectNavBar(),
      ),
    );
  }
}
