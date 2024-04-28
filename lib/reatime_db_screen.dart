import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/notes_model.dart';

class RealtimeDbScreen extends StatefulWidget {
  const RealtimeDbScreen({super.key, required this.title});

  final String title;

  @override
  State<RealtimeDbScreen> createState() => _RealtimeDbScreenState();
}

class _RealtimeDbScreenState extends State<RealtimeDbScreen> {
  int _counter = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  void _incrementCounter() {
    var notesModel = NotesModel(title: "Test", description: "Test");
    print("button click");
    ref
        .push()
        .set(notesModel.toJson())
        .then((value) => print("value "))
        .onError((error, stackTrace) => print("error $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
