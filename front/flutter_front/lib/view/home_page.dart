import 'package:flutter/material.dart';
import 'package:flutter_front/model/user_model.dart';
import 'package:flutter_front/model/users_model.dart';
import 'package:flutter_front/services/api.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHomePage();
  }
}

class _StateHomePage extends State<HomePage> {
  UserData usersData = UserData(users: []);

  signin() async {
    APICall apiCall = new APICall();
    apiCall.signIn("admin@admin.com", "password");
    await Future.delayed(const Duration(seconds: 2));
    usersData = await apiCall.getUsers();
    setState(() {
      usersData = usersData;
    });
  }

  @override
  Widget build(BuildContext context) {
    signin();
    return Scaffold(
      appBar: AppBar(
        title: Text("Personnes"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.separated(
              itemCount: usersData.users.length,
              itemBuilder: (BuildContext context, int index) {
                return UsersElementList(user: usersData.users[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 10,
                  ))),
    );
  }
}

class UsersElementList extends StatelessWidget {
  User user;

  UsersElementList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Icon(Icons.ac_unit_rounded)),
        Expanded(flex: 2, child: Text(user.email))
      ],
    );
  }
}
