import 'package:flutter/material.dart';
import 'package:projectpartner/providers/projects_provider.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/tag_card.dart';
import '../widgets/profile_card.dart';
import '../widgets/join_button.dart';

class ProjectDetailScreen extends StatelessWidget {
  static const routeName = '/project-detail';
  const ProjectDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, -1),
              child: Hero(
                tag: args['herotag'],
                child: Image.network(
                  args['image'],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          args['title'],
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Text(
                          args['description'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              TagCard(text: "Computer Vision"),
                              TagCard(text: "AI"),
                              TagCard(text: "Image Processing"),
                              TagCard(text: "Embedded Systems"),
                            ],
                          ),
                        ),
                      ),
                      heading,
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: dummyUsers
                                  .map((user) => ProfileCard(
                                        name: user.name,
                                        imageUrl: user.imageUrl,
                                        role: user.role,
                                      ))
                                  .toList()),
                        ),
                      ),
                      GradientButton(
                        text: "Apply to project",
                        initialColor: Colors.purple,
                        finalColor: Colors.deepPurple,
                        onClick: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const ProjectNavBar(),
      ),
    );
  }
}

const Widget heading = Padding(
  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
  child: Text(
    "Meet the creators:",
    style: TextStyle(fontStyle: FontStyle.italic),
  ),
);
