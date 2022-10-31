import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojaflutter/models/cart_model.dart';

class DiscountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          'Discount coupon',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey[700]),
        ),
        leading: Icon(
          Icons.card_giftcard,
          color: Colors.amber,
        ),
        trailing: Icon(Icons.add, color: Theme.of(context).primaryColor),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Type your Coupon'),
              initialValue: CartModel.of(context).couponCode ?? '',
              onFieldSubmitted: (text) {
                FirebaseFirestore.instance
                    .collection('coupons')
                    .doc(text)
                    .get()
                    .then((docSnap) {
                  if (docSnap.data() != null) {
                    CartModel.of(context)
                        .setCoupon(text, docSnap.data()['percent']);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Desconto de ${docSnap.data()['percent']}% aplicado!"),
                      backgroundColor: Theme.of(context).primaryColor,
                    ));
                  } else {
                    CartModel.of(context).setCoupon(null, 0);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Coupon does not exist!"),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
