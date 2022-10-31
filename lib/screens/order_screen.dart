import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {

  final String orderId;

  OrderScreen(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Order Completed'),
      centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,     
          children: <Widget>[

            Icon(Icons.check,
             color: Theme.of(context).primaryColor,
             size: 88.0,
            ),
            Text('Order successfully placed!',
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0
              ),
            ),
            Text(
              'Request code: $orderId', 
              style: TextStyle(
              fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
