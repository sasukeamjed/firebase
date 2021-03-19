import 'package:firebaseriverpodtut/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class LoginPage extends ConsumerWidget {

  void updateEmail(){

  }

  void updatePassword(){

  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authService = watch(authServicesProviders);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value){},
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          RaisedButton(
            onPressed: () {
              authService.login(email, password)
            },
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }
}
