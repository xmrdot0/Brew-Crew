import 'package:flutter/material.dart';
import 'package:learnbloooc/models/brew.dart';
import 'package:learnbloooc/screens/home/brew_list.dart';
import 'package:learnbloooc/screens/home/settings_form.dart';
import 'package:learnbloooc/services/auth.dart';
import 'package:learnbloooc/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Brew Crew'),
          elevation: 0.0,
          actions: [
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text("Logout", style: TextStyle(color: Colors.black))),
            TextButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings, color: Colors.black),
              label: Text('settings', style: TextStyle(color: Colors.black)),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
