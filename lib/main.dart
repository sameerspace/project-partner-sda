import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectpartner/screens/project_detail_screen.dart';
import 'screens/home_page.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: "Montserrat",
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePageScreen();
            }
            if (snapshot.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Error connecting to firebase"),
                backgroundColor: Colors.white,
              ));
            }
            return const LoginScreen();
          }),
      routes: {
        HomePageScreen.routeName: (ctx) => const HomePageScreen(),
        ProjectDetailScreen.routeName: (ctx) => const ProjectDetailScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
      },
    );
  }
}
