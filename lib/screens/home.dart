import 'package:flutter/material.dart';
import 'package:lingo_app/screens/challenges_page.dart';
import 'package:lingo_app/screens/home_page.dart';
import 'package:lingo_app/screens/profile_page.dart';
import 'package:lingo_app/styles/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController();
  int _currentIndex = 0;
  String _languageType;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(), ChallengesPage(), ProfilePage(),
        ],
        onPageChanged: switcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconSize: 28.0,
        selectedFontSize: 16.0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: switcher,
        items: [
          BottomNavigationBarItem(
            label: home_title,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: challenge_title,
            icon: Icon(Icons.videogame_asset_rounded),
          ),
          BottomNavigationBarItem(
            label: profile_title,
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
  int switcher (int index){
    setState(() {
      _currentIndex = index;
      _controller.jumpToPage(_currentIndex);
    });
  }
}
