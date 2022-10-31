import 'package:flutter/material.dart';

class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          'Calculate Shipping',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.grey[700]),
        ),
        leading: Icon(
          Icons.location_on
        ),
        trailing: Icon(Icons.add, color: Theme.of(context).primaryColor),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Zip code'),
              initialValue:'',
              onFieldSubmitted: (text) {
                
              },
            ), 
          ),
        ],
      ),
    );
  }
}