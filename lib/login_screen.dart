import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/reatime_db_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Enter email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Enter password";
                  } else if ((value?.length ?? 0) < 5) {
                    return "Password must be of atleast 5 characters";
                  } else {
                    return null;
                  }
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      auth
                          .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RealtimeDbScreen(
                                              title: "Database")),
                                  (route) => false))
                          .onError(
                              (error, stackTrace) => print("error $error"));
                    }
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
