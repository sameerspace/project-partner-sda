import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  final String text;
  const TagCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 0, color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(text),
      ),
    );
  }
}
