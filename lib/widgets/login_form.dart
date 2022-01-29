import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectpartner/widgets/join_button.dart';
import '../screens/sign_up_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoading = false;
  String email = "ASD";
  String password = "ASD";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(
            child: Text(
              'Project Partner',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.02),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty || !value.contains('@umt.edu.pk')) {
                        return 'Please enter valid UMT email';
                      }
                      return null;
                    }
                    return null;
                  },
                  onSaved: (newValue) => email = newValue ?? "ASD",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.02),
                child: TextFormField(
                  decoration: const InputDecoration(
                      label: Text("Password",
                          style: TextStyle(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value!.isEmpty) return "Password cannot be empty";
                    if (value.length < 8) {
                      return "Password should be greater than 8 characters";
                    }
                    return null;
                  },
                  onSaved: (newValue) => password = newValue ?? "ASD",
                ),
              ),
              GradientButton(
                text: "Login",
                initialColor: Colors.amber,
                finalColor: Colors.amber,
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    _formKey.currentState!.save();
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      setState(() => isLoading = false);
                    });
                  } else {
                    debugPrint("ERROR LOGGING");
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                child: const Text(
                  "Create an account ?",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
