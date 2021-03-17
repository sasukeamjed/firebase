import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
            onPressed: () {},
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }
}
