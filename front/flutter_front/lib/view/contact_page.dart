import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatelessWidget {
  setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("jwt"));
  }

  @override
  Widget build(BuildContext context) {
    setup();
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [Expanded(child: Text("bonjour"))],
        ),
      ),
    );
  }
}
