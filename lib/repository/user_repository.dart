import 'dart:convert';
import 'dart:io';
import 'package:LMShubAdmin/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

User currentUser = new User();
final navigatorKey = GlobalKey<NavigatorState>();

Future<User> login(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_url')}login';
  print(url);
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser = User.fromJSON(json.decode(response.body)['data']);
  }
  return currentUser;
}

register(User user) async {
  final String url = '${GlobalConfiguration().getValue('api_url')}register';

  print(url);

  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.toMap()),
  );
  print(json.encode(user.toMap()));
  return response.statusCode;
}

Future<void> logout() async {
  currentUser = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('LMShub');
}

void setCurrentUser(jsonString) async {
  if (json.decode(jsonString)['data'] != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(json.encode(json.decode(jsonString)['data']));
    await prefs.setString(
        'LMShub', json.encode(json.decode(jsonString)['data']));
  }
}

Future<User> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('LMShub')) {
    currentUser = User.fromJSON(json.decode(await prefs.get('LMShub')));
  }
  return currentUser;
}
