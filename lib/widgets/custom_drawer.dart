import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lojaflutter/models/user_model.dart';
import 'package:lojaflutter/tiles/drawer_tile.dart';
import 'package:lojaflutter/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  //  PickedFile  _imageFile;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
           //   Color.fromARGB(255, 203, 236, 241),
           Color.fromARGB(200, 200, 200, 200),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Flutter\nShop",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 34.0, color: Colors.pink[800]) 
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 135.0,
                        child: Image.asset('images/flushop.png', width: 110,)
                        //     child: CircleAvatar(

                        //       backgroundColor: Colors.white,
                        //       radius: 50.0,
                        //       backgroundImage: _imageFile != null ? FileImage(File(_imageFile.path)) : AssetImage("images/person.png"),
                        //      // backgroundImage: _imageFile == null ? AssetImage("images/person.png") : FileImage(File(_imageFile.path)),
                        //     ),
                        //     onTap: () {
                        //       _chooseImag
                        //     },
                        ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello, ${!model.isLoggedIn() ? "" : model.userData['name']}",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child: Text(
                                !model.isLoggedIn()
                                    ? "Log in or Sign Up >"
                                    : "Log Out",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                if (!model.isLoggedIn())
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                else
                                  model.signOut();
                              },
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Home", widget.pageController, 0),
              DrawerTile(Icons.list, "Products", widget.pageController, 1),
              DrawerTile(Icons.location_on, "Shops", widget.pageController, 2),
              DrawerTile(Icons.playlist_add_check, "My Requests",
                  widget.pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
