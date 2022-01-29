import 'package:flutter/material.dart';
import '../screens/project_detail_screen.dart';

class ProjectCard extends StatelessWidget {
  final String projectId;
  final String imageUrl;
  final String mytitle;
  final String description;
  const ProjectCard({
    required this.projectId,
    required this.description,
    required this.mytitle,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProjectDetailScreen.routeName, arguments: {
        'title': mytitle,
        'image': imageUrl,
        'description': description,
        'herotag': projectId,
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: projectId,
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        child: Ink.image(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        mytitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      child: const Text(
                        'View Details',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                    const IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: null,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
