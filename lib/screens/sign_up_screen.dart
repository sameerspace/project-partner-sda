import 'package:flutter/material.dart';
import 'package:projectpartner/widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signup-screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: const Center(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
