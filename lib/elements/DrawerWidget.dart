import 'package:LMShubAdmin/controllers/profile_controller.dart';
import 'package:LMShubAdmin/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends StateMVC<DrawerWidget> {
  // ignore: unused_element
  ProfileController _con;

  _DrawerWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              accountName: Text(
                _con.user.firstName ?? ' ',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                _con.user.email ?? ' ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => {
                //
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Borrow Request'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Book'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                logout().then((value) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/Login', (Route<dynamic> route) => false);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
