import 'package:flutter/material.dart';
import 'package:jiken/Page%20Utama/Beranda.dart';
import 'package:jiken/Page%20Utama/Profile.dart';

class NaviPage extends StatefulWidget {
  const NaviPage({super.key});

  @override
  State<NaviPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<NaviPage> {
  int _butind = 0;
  List<Widget> _Page = [Berandapage(), Profilepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Page[_butind],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purpleAccent,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _butind = value;
            });
          },
          currentIndex: _butind,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: "Beranda",
                activeIcon: new Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                )),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                activeIcon: new Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                label: "Profile")
          ]),
    );
  }
}
