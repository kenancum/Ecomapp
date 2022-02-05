import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuDrawerState();
}

class ProfileDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey[900]),
      child: new Drawer(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0),
            height: 40,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10.0),
                  child: Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(65.0)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "username",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "⬤ Online ",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.account_circle,
                                color: Colors.grey, size: 25)),
                        TextSpan(
                          text: " My Profile",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.inbox,
                                color: Colors.grey, size: 25)),
                        TextSpan(
                          text: " Inbox",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.group,
                                color: Colors.grey, size: 25)),
                        TextSpan(
                          text: " Communities",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.account_balance_wallet,
                                color: Colors.grey, size: 25)),
                        TextSpan(
                          text: " My Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.whatshot,
                                color: Colors.grey, size: 25)),
                        TextSpan(
                          text: " Badges",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 175),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.feedback,
                                color: Colors.grey, size: 20)),
                        TextSpan(
                          text: " Give us a feedback",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _ProfileDrawerStateLogin extends State {
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey[900]),
      child: new Drawer(
        child: new Container(
            margin: const EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0),
            height: 40,
            child: new Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 200, bottom: 20.0),
                    child: new Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: new TextFormField(
                    autofocus: false,
                    style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    decoration: new InputDecoration(
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: new TextFormField(
                      autofocus: false,
                      style:
                          TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: new InputDecoration(
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text('Login'),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up!',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\nForget Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class _MenuDrawerState extends State {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.blueGrey[900]),
        child: new Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/events');
                },
                child: Text("Events",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/donate');
                },
                child: Text("Donate",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/faq');
                },
                child: Text("F.A.Q.",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: Text("About Us",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
              Divider(
                color: Colors.white,
                height: 80,
                indent: 60,
                endIndent: 60,
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Text("Settings",
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
            ],
          ),
        ));
  }
}
