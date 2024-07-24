import 'package:flutter/material.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/NotifikasiPage.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/PencarianPage.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/ProfilPage.dart';

class NavigasiPage extends StatefulWidget {
  int ind;
  NavigasiPage(this.ind);

  @override
  State<NavigasiPage> createState() => _NavigasiPageState();
}

class _NavigasiPageState extends State<NavigasiPage> {
  int buttomindex = 0;
  List<Widget> _Page = [
    new HomePage2(),
    new PencarianPage(),
    new NotifikasiPage(),
    new ProfilPage(),
  ];
  @override
  void initState() {
    buttomindex = widget.ind;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Page[buttomindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purpleAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            buttomindex = index;
          });
        },
        currentIndex: buttomindex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: new Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              activeIcon: new Icon(
                Icons.search,
                color: Colors.grey,
              ),
              label: "Pencarian"),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              activeIcon: new Icon(
                Icons.notifications,
                color: Colors.deepPurple,
              ),
              label: "Notifikasi"),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.person,
                color: Colors.grey,
              ),
              activeIcon: new Icon(
                Icons.person,
                color: Colors.grey,
              ),
              label: "Profil")
        ],
      ),
    );
  }
}
