import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Color initialColor;
  final Color finalColor;
  final String text;
  final VoidCallback onClick;
  const GradientButton({
    Key? key,
    required this.initialColor,
    required this.finalColor,
    required this.onClick,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.0,
        margin:
            EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.05)),
        child: MaterialButton(
          onPressed: onClick,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [initialColor, finalColor],
                ),
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints:
                  const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
