import 'package:flutter/material.dart';
import 'package:learnbloooc/services/auth.dart';
import 'package:learnbloooc/shared/constants.dart';
import 'package:learnbloooc/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
                backgroundColor: Colors.brown[400],
                elevation: 0,
                title: Text("Signup to Brew Crew"),
                actions: [
                  TextButton.icon(
                      onPressed: () {
                        widget.toggleView();
                      },
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.black),
                      ))
                ]),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) =>
                            val.length < 6 ? 'Enter a oasswird 6+ chars' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text('Register',
                            style: TextStyle(color: Colors.black)),
                      )
                    ],
                  )),
            ),
          );
  }
}
