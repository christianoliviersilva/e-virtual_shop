import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lojaflutter/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _addressController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // String userImageUrl = "";
  // static final String userAvatarUrl = 'url';
  // final picker = ImagePicker();
  // PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    //  double _screenWidth = MediaQuery.of(context).size.width,
    //    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Create Account"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                // InkWell(
                //   onTap: selectAndPickImage,
                //   child: CircleAvatar(
                //     radius: _screenWidth * 0.15,
                //     backgroundColor: Colors.black,
                //     backgroundImage: _imageFile == null
                //         ? null
                //         : FileImage(File(_imageFile.path)),
                //     child: _imageFile == null
                //         ? Icon(
                //             Icons.add_photo_alternate,
                //             size: _screenWidth * 0.15,
                //           )
                //         : null,
                //   ),
                // ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[500], width: 1.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  validator: (text) {
                    if (text.isEmpty) {
                      return "Invalid Name!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[500], width: 1.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty ||
                        !text.contains("@") ||
                        text.length <= 1) {
                      return "Invalid E-mail!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[500], width: 1.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Invalid Password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    hintText: "Address",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[500], width: 1.0),
                    ),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  validator: (text) {
                    if (text.isEmpty) {
                      return "Invalid Address!";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          //  "uid": model.firebaseUser.uid,
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text,
                        //  'url' : model.firebaseUser.photoURL
                        };

                        model.signUp(
                          userData: userData,
                          pass: _passController.text,
                          onSucess: _onSucess,
                          onFail: _onFail,
                        );
                      }
                      //

//  Map<String, dynamic> userData = new Map<String, dynamic>(); 1
//  userData["url"] = await (await task).ref.getDownloadURL(); 2
//  userData["url"] = userImageUrl; 3
//  String url = await (await task).ref.getDownloadURL();
//   url = ;
// UserModel.userImageUrl = urlImage;

//   String url = await (await task).ref.getDownloadURL();
// userData['imgUrl'] = url;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSucess() {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("User created successfully!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2)));

    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to create user!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2)));
  }
}
