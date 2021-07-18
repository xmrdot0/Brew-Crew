import 'package:flutter/material.dart';
import 'package:learnbloooc/models/user.dart';
import 'package:learnbloooc/screens/wrapper.dart';
import 'package:learnbloooc/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
