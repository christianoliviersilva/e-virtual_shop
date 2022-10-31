import 'package:flutter/material.dart';
import 'package:lojaflutter/tabs/home_tab.dart';
import 'package:lojaflutter/tabs/orders_tab.dart';
import 'package:lojaflutter/tabs/places_tab.dart';
import 'package:lojaflutter/tabs/products_tab.dart';
import 'package:lojaflutter/widgets/cart_button.dart';
import 'package:lojaflutter/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            centerTitle: true,            
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ), 

        Scaffold(
          appBar: AppBar(
            title: Text('Shops'),
            centerTitle: true
            ),
            body: PlacesTab(),
            drawer: CustomDrawer(_pageController),
          ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'My Requests',
            ),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
