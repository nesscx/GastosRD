import 'package:flutter/material.dart';
import 'package:gastos_rd/screens/auth/sign_in.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socialy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SignIn(),
    );
  }
}