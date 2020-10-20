import 'package:LMShubAdmin/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:LMShubAdmin/repository/user_repository.dart' as userRepo;

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends StateMVC<RegisterWidget> {
  UserController _con;

  _RegisterWidgetState() : super(UserController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.token != null) {
      Navigator.of(context).pushReplacementNamed('/Library', arguments: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child:
                    Center(child: Image.asset('assets/images/libary_icon.png')),
              ),
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _con.registerFormKey,
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.firstName = input,
                      validator: (input) => input.length < 3
                          ? "Should be more than 3 characters"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.lastName = input,
                      validator: (input) => input.length < 3
                          ? "Should be more than 3 characters"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => _con.user.email = input,
                      validator: (input) => !input.contains('@')
                          ? "Should be a valid email"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (input) => _con.user.phone = input,
                      validator: (input) => input.length < 3
                          ? "Should be more than 3 characters"
                          : null,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.password = input,
                      validator: (input) => input.length < 3
                          ? "Should be more than 3 characters"
                          : null,
                      obscureText: _con.hidePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _con.hidePassword = !_con.hidePassword;
                              });
                            },
                            color: Theme.of(context).focusColor,
                            icon: Icon(_con.hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor))),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).accentColor,
                        elevation: 7.0,
                        child: FlatButton(
                          onPressed: () {
                            _con.register();
                          },
                          padding: EdgeInsets.symmetric(horizontal: 66),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
