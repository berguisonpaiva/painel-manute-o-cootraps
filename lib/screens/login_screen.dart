import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 250.0,
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                      decoration:
                                          InputDecoration(hintText: 'Email'),
                                      validator: (value) {
                                        if (value.isEmpty)
                                          return 'Preencha corretamente!';
                                      }),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration:
                                        InputDecoration(hintText: 'Password'),
                                    validator: (value) => value.isEmpty
                                        ? 'Preencha corretamente!'
                                        : null,
                                    onChanged: (value) {
                                      this.password = value;
                                    },
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  if (checkFields()) {}
                                },
                                child: Container(
                                    height: 40.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.2),
                                    ),
                                    child: Center(child: Text('Sign in'))))
                          ],
                        ))
                  ],
                ))));
  }
}
