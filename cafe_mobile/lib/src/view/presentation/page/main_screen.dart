import 'package:cafe_mobile/src/core/constans/bottom_navigation_bar_items.dart';
import 'package:cafe_mobile/src/core/constans/value_notifier.dart';
import 'package:cafe_mobile/src/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final screens = bottomNavigationBarItmes.map((e)=> e.screen).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: ValueListenableBuilder(
        valueListenable: bottomNavigationIndex,
        builder: (context, value, child) => Stack(
          children: [
            IndexedStack( index: value, children: screens),
            BottomNavigationBarWidget(selected: value, )
          ],
        ),
      ),
    );
  }
}


