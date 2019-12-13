import 'package:flutter/material.dart';

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}

String email = '';
String password = '';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(100, 100, 100, 40),
        margin: EdgeInsets.fromLTRB(
          20,
          100,
          20,
          100,
        ),
        color: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 30),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'NoGo',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
                new TextField(
                  decoration: new InputDecoration(hintText: "name@example.com"),
                  onChanged: (String input) {
                    email = input;
                  },
                ),
                new TextField(
                  decoration: new InputDecoration(hintText: "password"),
                  onChanged: (String input) {
                    password = input;
                  },
                ),
                new FlatButton(
                  onPressed: () {
                    if (email != '') {
                      //Email and password combo is successful.
                      navigateToSubPage(context);
                    }
                  },
                  child: Text('Login'),
                  color: Colors.red[900],
                ),
              ],
            ),
          ),
          //color: Colors.red[900],
        ),
        //floatingActionButton:
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NoGo'),
          backgroundColor: Colors.red[900],
        ),
        body: RaisedButton(
          textColor: Colors.white,
          color: Colors.red[900],
          child: Text('Log out'),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}

