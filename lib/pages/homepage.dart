import 'package:ecom/components/bottom_nav.dart';
import 'package:ecom/models/shoe.dart';
import 'shop_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'intropage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  final List<Shoe> _shoeShop = [
    Shoe(
      name: "Nike Air Max",
      price: "240",
      imagePath: "lib/store/shoe1.png",
      description: "Lightweight running shoe",
    ),
    Shoe(
      name: "Nike Zoom",
      price: "220",
      imagePath: "lib/store/shoe2.png",
      description: "Comfortable everyday shoe",
    ),
    Shoe(
      name: "Nike Pegasus",
      price: "260",
      imagePath: "lib/store/shoe3.png",
      description: "Premium running shoe",
    ),
    Shoe(
      name: "Nike Revolution",
      price: "210",
      imagePath: "lib/store/shoe4.png",
      description: "Perfect gym shoe",
    ),
  ];

  final List<Shoe> _cart = [];
  // this methood will be used for UPDATING THE SELECTED INDEX
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addShoeToCart(Shoe shoe) {
    setState(() {
      _cart.add(shoe);
    });
  }

  void logout() {
    setState(() {
      _cart.clear();
      _selectedIndex = 0;
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Intropage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ShopPage(shoes: _shoeShop, onAddToCart: addShoeToCart),
      CartPage(cartItems: _cart),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBarS(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset("lib/store/logo.png")),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(color: Colors.grey[800]),
                ),
                //other pages
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text("HOME", style: TextStyle(color: Colors.white)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text("ABOUT", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("LOG OUT", style: TextStyle(color: Colors.white)),
                onTap: logout,
              ),
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
    );
  }
}
