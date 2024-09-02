import 'package:cafe_mobile/src/view/presentation/page/favorite_screen.dart';
import 'package:cafe_mobile/src/view/presentation/page/home_screen.dart';
import 'package:cafe_mobile/src/view/presentation/page/profile_screen.dart';
import 'package:cafe_mobile/src/view/presentation/widget/home_widgets/cart_screen.dart';
import 'package:flutter/material.dart';



//? bottomNavigationBar Items
class BottomNavigationItem {
  final int index;
  final Widget screen;
  final String title;
  final IconData icon;
  BottomNavigationItem(this.index,this.screen, this.title, this.icon);
}
final List<BottomNavigationItem> bottomNavigationBarItmes =  [ 
    BottomNavigationItem( 0 ,const HomeScreen() , "", Icons.home),
    BottomNavigationItem( 1 ,const FavoriteScreen() , "", Icons.favorite),
    BottomNavigationItem( 2 ,const HomeScreen() , "reserve", Icons.favorite),
    BottomNavigationItem( 3 ,const CartScreen() , "", Icons.shopping_cart),
    BottomNavigationItem( 4 ,const ProfileScreen() , "", Icons.person),
];
