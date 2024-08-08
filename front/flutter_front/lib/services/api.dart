import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_front/model/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APICall {
  Dio dio = Dio();

  signIn(String email, String password) async {
    final body = {
      "email": email,
      "password": password,
    };

    Response response = await dio.post('http://10.0.2.2:8080/auth/signIn',
        data: jsonEncode(body));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("jwt", response.data["token"].toString());
  
  }

  Future<UserData> getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${prefs.getString("jwt")}";
    Response response2 = await dio.get('http://10.0.2.2:8080/users');

    var data = response2.data;
    UserData dataUsers = UserData.fromJson(data);
    return dataUsers;
  }
}
