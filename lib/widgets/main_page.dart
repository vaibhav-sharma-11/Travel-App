import 'package:flutter/material.dart';
import 'package:travel_app/screens/welcome_page.dart';
import 'package:travel_app/widgets/home_page.dart';
import 'package:travel_app/widgets/my_page.dart';
import 'package:travel_app/widgets/responsivebar.dart';
import 'package:travel_app/widgets/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    HomePage(),
    BarItem(),
    SearchPage(),
    MyPage(),
  ];

  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageindex,
        onTap: (index){
          setState(() {
            pageindex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: "Bar",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "My",
          ),
        ],
      ),
      body: pages[pageindex],
    );
  }
}
