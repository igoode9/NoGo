import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart'; 
import 'user_data-rev.dart'; // index into list, extract data
import 'installed-rev.dart'; // index into list, extract data


// GoogleMaps API display page 
// developed by Project Lead (Delaney) and Technical Lead (Will)
class MapPage extends MapPage {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    // implement initState
    super.initState();
    specificToUser.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.name, snippet: element.location),
          position: element.coordinates));
      // add selection statement for different colored markers
      // different colored markers corresponds to different types of user data
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _specificToUser(index) { // list name from User-data-rev.dart
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white), // consistent with theme developed by interface lead 
                        child: Row(children: [
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  specificToUser[index].name,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  specificToUser[index].type,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  specificToUser[index].location,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    specificToUser[index].display,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(42.349553, -71.117384), zoom: 12.0), // use geolocation to open to location user is 
                markers: Set.from(allMarkers), // displays all preset markers at once 
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: specificToUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _specificToUser(index); // returning index information from list
                  },
                ),
              ),
            )
          ],
        )); // exiting all widgets from class 
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: specificToUser[_pageController.page.toInt()].coordinates,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0))); // ability to animate camera, move around map 
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}


// login page 
// developed by Interface Lead, Emma
// assistance from Specification Lead (Stephanie) and Documentation Lead (Isabelle) 
String email = '';
String password = '';
String search = 'Mary Jane';

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
                    if(email != userPass[index].name || password != userPass[index].password)
                    {
                      return "Incorrect username or password";
                    }
                    else
                    {
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
              decoration: new InputDecoration(hintText: "search new friends"),
              onChanged: (String input) {
                search = input;
              },
            ),
            padding: EdgeInsets.fromLTRB(260, 350, 10, 20),
          ),
          Container(
            child: new Text(search), //Adds to the list of friends
            padding: EdgeInsets.fromLTRB(30, 430, 0, 0),
          ),
          Container(
            child: new Text(
              'My Friends:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            padding: EdgeInsets.fromLTRB(30, 400, 0, 0),
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
