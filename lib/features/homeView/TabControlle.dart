import 'package:flutter/material.dart';
import 'package:foodgo/features/homeView/Person.dart';
import 'package:foodgo/features/homeView/homeView.dart';
import 'package:foodgo/features/homeView/Favorite.dart';
import 'package:foodgo/features/homeView/shoppingCart.dart';
class TabControlle extends StatefulWidget {
  const TabControlle({super.key});

  @override
  State<TabControlle> createState() => _TabControlleState();
}

class _TabControlleState extends State<TabControlle> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeVeiw(),
    Person(),
    Favorite(),
    ShoppingCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Color(0xFFEF2A39),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

        ],
      ),
    );
  }
}
