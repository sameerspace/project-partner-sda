import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String image;
  final String department;
  const UserTile({
    Key? key,
    required this.name,
    required this.image,
    required this.department,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(16),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(20),
          tileColor: Colors.white,
          title: Text(
            name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Department: $department"),
          trailing: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(image),
          ),
          onTap: null,
        ),
      ),
    );
  }
}
