/*
basis for list created as a dart file 
protects user input

user_name-password-44 Cummington Mall, Boston, MA 02215
james_smith-password-275 Babcock St, Boston, MA 02215 
mike_smith-password-8 St Marys St, Boston, MA 02215
robert_smith-password-8 St Marys St, Boston, MA 02215
maria_garcia-password-735 Commonwealth Avenue, Boston, MA 02215
david_smith-password-4 Jersey St, Boston, MA 02215
*/

import 'package:google_maps_flutter/google_maps_flutter.dart';

// simulates a database that stores username and password 
// separate from user data file to increase security measures of the application

class UserPassword{
	String name; 
	String password; 
	String address; 

// generate list structure 

  UserPassword(
      {this.name, this.password, this.address});
} // end class

// list for class 

final List<UserPassword> userPass = [
UserPassword(
    name: 'james smith',
    password: 'password',
    address: '275 Babcock St, Boston, MA 02215',
  ),

  UserPassword(
    name: 'mike smith',
    password: 'password', 
    address: '8 St Marys St, Boston, MA 02215', 
    ), 

    UserPassword(
    name: 'robert smith',
    password: 'password'
    address: '8 St Marys St, Boston, MA 02215', 
    ), 

    UserPassword(
    name: 'maria garcia', 
    password: 'password', 
    address: '735 Commonwealth Avenue, Boston, MA 02215', 
    ), 

    UserPassword(
    name: 'david smith', 
    password: 'password', 
    address: '4 Jersey St, Boston, MA 02215' )
]; 
