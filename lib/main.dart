import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/models/cart_model.dart';
import 'package:lojaflutter/models/user_model.dart';
import 'package:lojaflutter/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
              model: CartModel(model),
              child: MaterialApp(
                title: "Flutter Shop",
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                   //  primaryColor: Color.fromARGB(255, 4, 125, 141)),
                     primaryColor: Color.fromARGB(255, 211, 118, 130)),
                    
              
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
            )
          );
        },
      ),
    );
  }
}
