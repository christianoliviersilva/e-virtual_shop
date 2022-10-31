import 'package:flutter/material.dart';
import 'package:lojaflutter/screens/cart_screen.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.shopping_cart,
        color: Colors.blue[50],
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CartScreen()));
      },
      //backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Color.fromARGB(255, 211, 118, 130),
    );
  }
}
