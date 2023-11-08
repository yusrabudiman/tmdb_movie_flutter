import 'package:flutter/material.dart';
import 'package:spons/navigation/home.dart';
import 'package:spons/navigation/search.dart';
import 'package:spons/navigation/watchlist.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String title = "Home";

  int _indexNavigation = 0;

  @override
  Widget build(BuildContext context) {
    Widget _widgetNavigation() {
      if (_indexNavigation == 0) {
        return HomeList();
      } else if (_indexNavigation == 1) {
        return appSearch();
      } else {
        return Watchlist();
      }
    }

    return Scaffold(
      body: _widgetNavigation(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNavigation,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Watchlist')
        ],
        onTap: (value) {
          if (value == 0) {
            title = "Home";
          }
          if (value == 1) {
            title = "Search";
          }
          if (value == 2) {
            title = "Watchlist";
          }
          setState(() {
            _indexNavigation = value;
          });
        },
      ),
    );
  }
}
