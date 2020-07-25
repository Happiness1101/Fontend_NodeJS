import 'package:flutter/material.dart';
import 'package:myproject/utility/my_style.dart';
import 'package:myproject/utility/nomal_dialog.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  String user, id, password;
  bool vis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [Colors.white, Colors.blue[200]],
        //       begin: FractionalOffset(0.0, 1.0),
        //       end: FractionalOffset(0.0, 1.0)),
        // ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                iconApp(),
                MyStyle().mySizeBox(0.0, 50.0),
                usernameFrom(),
                MyStyle().mySizeBox(0.0, 10.0),
                idFrom(),
                MyStyle().mySizeBox(0.0, 10.0),
                passwordFrom(),
                MyStyle().mySizeBox(0.0, 20.0),
                loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconApp() {
    return Image.asset(
      "images/flutter.png",
      width: 250.0,
    );
  }

  Widget loginButton() {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            id == null ||
            id.isEmpty ||
            password == null ||
            password.isEmpty) {
          nomalDialog(context, "*เกิดข้อผิดผลาด กรุณาลองใหม่");
        } else {}
      },
    );
  }

  Widget usernameFrom() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) {
            user = value.trim();
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.face,
              color: Colors.deepPurple,
            ),
            labelStyle: TextStyle(color: Colors.black26),
            labelText: 'User:',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade300)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade600)),
          ),
        ),
      );

  Widget idFrom() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) {
            id = value.trim();
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.face,
              color: Colors.deepPurple,
            ),
            labelStyle: TextStyle(color: Colors.black26),
            labelText: 'ID: ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade300)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade900)),
          ),
        ),
      );

  Widget passwordFrom() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) {
            password = value.trim();
          },
          obscureText: vis,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.deepPurple,
              ),
              labelStyle: TextStyle(color: Colors.black26),
              labelText: 'Password:',
              //helperText: "Password must more 4 char",
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue.shade600)),
              suffixIcon: IconButton(
                icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    vis = !vis;
                  });
                },
              )),
        ),
      );
}
