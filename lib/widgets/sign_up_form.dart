import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/login_screen.dart';
import '../widgets/join_button.dart';
import '../widgets/photo_avatar.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isLoading = false;

  String email = "dummy";
  String password = "dummy";
  String name = "dummt=y";

  final _formKey = GlobalKey<FormState>();

  void submitImage() {
    debugPrint("Uploading Image");
  }

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print("USERID:${user.user!.uid}");
        FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
          'name': name,
          'image':
              'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'department': 'Software Engineering',
        });
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontStyle: FontStyle.italic),
              ),
            ),
            PhotoAvatar(
              submitFn: submitImage,
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
                        "Name",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (newValue) => name = newValue ?? "ASD",
                  ),
                ),
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
                  text: "Sign Up",
                  initialColor: Colors.amber,
                  finalColor: Colors.amber,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      _formKey.currentState!.save();
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
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
                      Navigator.of(context).pushNamed(LoginScreen.routeName),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
