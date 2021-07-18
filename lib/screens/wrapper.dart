import 'package:flutter/material.dart';
import 'package:learnbloooc/models/user.dart';
import 'package:learnbloooc/screens/authenticate/authenticate.dart';
import 'package:learnbloooc/screens/authenticate/sign_in.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    return user == null ? Authenticate() : Home();
  }
}
