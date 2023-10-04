import 'package:flutter/material.dart';
import 'package:movie/model/up_coming_model.dart';
import 'package:movie/tabes/browse-tab.dart';
import 'package:movie/tabes/home_tab.dart';
import 'package:movie/tabes/search_tab.dart';
import 'package:movie/tabes/watchList.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            fixedColor: Color(0xffFFBB3B),
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Browse'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_alt), label: 'WatchList')
            ]),
        body: tabs[currentIndex]);
  }
}
