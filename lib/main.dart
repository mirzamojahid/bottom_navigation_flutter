/*

import 'package:bottom_nav/cart.dart';
import 'package:bottom_nav/home.dart';
import 'package:bottom_nav/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final _page = [Home(), Cart(), Order()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.black,
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          backgroundColor: Colors.amberAccent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          ]),
      body: true
          ? _page[_currentIndex]
          : IndexedStack(
              index: _currentIndex,
              children: _page,
            ),
    );
  }
}
*/

import 'package:bottom_nav/cart.dart';
import 'package:bottom_nav/home.dart';
import 'package:bottom_nav/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final _page = [Home(), Cart(), Order()];
  PageController _pageController = PageController();

  void onItemClick(int index) {
    _pageController.jumpToPage(index);
  }

  void _onChangedPage(int index) {
    _currentIndex = index;
  }

  @override
  void dispose() {
    // TODO: implement dispose_
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.black,
          onTap: onItemClick,
          backgroundColor: Colors.amberAccent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          ]),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onChangedPage,
        children: _page,
      ),
    );
  }
}
