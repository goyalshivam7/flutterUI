import 'package:flutter/material.dart';

class Auth extends StatefulWidget {

  Auth(this.submitFn);

  final void Function(String emailId, String pass)submitFn;

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  final email = TextEditingController();
  final password = TextEditingController();

// trim() is used to remove whiteSpace

  void submit() {
    print(email.text);
    print(password.text);
    widget.submitFn(
      email.text.trim(),
      password.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.green[800], title: Text('Login Page')),
      body: Container(
          color: Colors.tealAccent[100],
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12.0),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: email,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12.0),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[500])),
                        controller: password,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: OutlineButton(
                        highlightColor: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(12.0),
                        onPressed: submit,
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
