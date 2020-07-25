import 'package:flutter/material.dart';
import 'package:myproject/screen/singup.dart';
import 'package:myproject/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue[200]],
              begin: FractionalOffset(0.0, 1.0),
              end: FractionalOffset(0.0, 1.0)),
        ),
        width: MediaQuery.of(context).size.height * 1.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SlideTransition(position: animation, child: iconApp()),
                MyStyle().mySizeBox(200.0, 100.0),
                boxContainer(
                    "images/facebook.png", "Sign Up wait Fackbook", null),
                MyStyle().mySizeBox(8.0, 8.0),
                boxContainer("images/google.png", "Sign Up wait Google", null),
                MyStyle().mySizeBox(8.0, 8.0),
                boxContainer(
                  "images/email.png",
                  "Sign Up wait Email",
                  onEmailClick,
                ),
                createAccount(),
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

  Widget createAccount() {
    return SlideTransition(
      position: animation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Text(
              "Already have an account?",
              style: TextStyle(color: Colors.black45, fontSize: 17.0),
            ),
            MyStyle().mySizeBox(8.0, 8.0),
            Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  onEmailClick() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SingUp(),
    ));
  }

  Widget boxContainer(String path, String text, onClick) {
    return SlideTransition(
      position: animation,
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width - 140,
          child: Card(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    path,
                    height: 40.0,
                    width: 40.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
