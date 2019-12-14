import 'package:flutter/material.dart';

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}

String email = '';
String password = '';
String search = 'Mary Jane';

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
        padding: EdgeInsets.fromLTRB(75, 75, 75, 75),
        margin: EdgeInsets.fromLTRB(
          30,
          150,
          30,
          100,
        ),
        color: Colors.grey[300],
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '   NoGo',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "username",
                    icon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                  ),
                  cursorColor: Colors.black,
                  cursorWidth: 7,
                  onChanged: (String input) {
                    email = input;
                  },
                ),
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "password",
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                  onChanged: (String input) {
                    password = input;
                  },
                ),
                new FlatButton(
                  onPressed: () {
                    //if (email != '') {
                    //Email and password combo is successful.
                    navigateToSubPage(context);
                    //}
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
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
      body: Stack(
        children: <Widget>[
          Container(
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.red[900],
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Log out'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              padding: EdgeInsets.fromLTRB(330, 550, 10, 10),
              color: Colors.white),
          Image(
            image: AssetImage('images/map.png'),
          ),
          Container(
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red[900],
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Work Mode'),
              onPressed: () {
                //Enter work mode... hides you from being seen by other users.
              },
            ),
            padding: EdgeInsets.fromLTRB(30, 350, 100, 20),
          ),
          Container(
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red[900],
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('Play Mode'),
              onPressed: () {
                //Enter play mode... allows you to be seen by other users
              },
            ),
            padding: EdgeInsets.fromLTRB(140, 350, 100, 20),
          ),
          Container(
            child: new TextField(
              decoration: new InputDecoration(
                  hintText: "Search", prefixIcon: Icon(Icons.search)),
              onChanged: (String input) {
                search = input;
              },
            ),
            padding: EdgeInsets.fromLTRB(260, 350, 10, 20),
          ),
          Container(
            child: new Text('''
            Izzy Goode
            Will Carson
            Delaney Dow
            '''), //Adds to the list of friends
            padding: EdgeInsets.fromLTRB(250, 430, 0, 0),
          ),
          Container(
            child: new Text(
              'My Friends:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            padding: EdgeInsets.fromLTRB(275, 400, 0, 0),
          ),
          Container(
            child: new Text('''
            Professor Densmore
            Ex-Boyfriend
            '''), //Adds to the list of friends
            padding: EdgeInsets.fromLTRB(0, 430, 0, 0),
          ),
          Container(
            child: new Text(
              'My Enemies:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            padding: EdgeInsets.fromLTRB(30, 400, 0, 0),
          ),
          Container(
            child: new Text('''
            Nub Pob
            '''), //Adds to the list of friends
            padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
          ),
          Container(
            child: new Text(
              'My Favorite Locations:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            padding: EdgeInsets.fromLTRB(30, 470, 0, 0),
          ),
          Container(
            child: new RaisedButton(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Text(
                'A friend is nearby! Click to see them on the map',
                style: TextStyle(
                  color: Colors.red[900],
                ),
              ),
              onPressed: () {
                //Show friend on map.
              },
            ),
            padding: EdgeInsets.fromLTRB(5, 550, 0, 0),
          ),
        ],
      ),
    );
  }
}


