import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseriverpodtut/providers/auth_providers.dart';
import 'package:firebaseriverpodtut/views/home_page.dart';
import 'package:firebaseriverpodtut/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthPage();
        }
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}

class AuthPage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, watch) {
    final stream = watch(authState);
    return stream.when(data: (value){
      if(value != null){
        return HomePage();
      }
      return LoginPage();
    }, loading: (){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }, error: (_, __){
      return Scaffold(
        body: Center(
          child: Text("OOPs"),
        ),
      );
    });
  }
}
