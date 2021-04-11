import 'package:firebaseriverpodtut/providers/auth_providers.dart';
import 'package:firebaseriverpodtut/providers/login_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class LoginPage extends ConsumerWidget {

  void updateEmail(BuildContext context, String email){
    context.read(emailProvider).state = email;
  }

  void updatePassword(BuildContext context, String password){
    context.read(passwordProvider).state = password;
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authService = watch(authServicesProviders);
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;
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
            onChanged: (value) {
              updateEmail(context, value);
            },
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value){
              updatePassword(context, value);
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          RaisedButton(
            onPressed: () {
              authService.signIn(email, password);
            },
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }
}
