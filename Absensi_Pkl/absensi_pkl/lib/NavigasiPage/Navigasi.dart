import 'package:absensi_pkl/Authentication/LoginPage.dart';
import 'package:absensi_pkl/NavigasiPage/Beranda.dart';
import 'package:absensi_pkl/NavigasiPage/Camera.dart';
import 'package:absensi_pkl/NavigasiPage/Logout.dart';
import 'package:flutter/material.dart';

class NavigasiPages extends StatefulWidget {
  const NavigasiPages({super.key});

  @override
  State<NavigasiPages> createState() => _NavigasiPagesState();
}

class _NavigasiPagesState extends State<NavigasiPages> {
  void logact(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Log Out?"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("No")),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }), (route) => false);
                      },
                      child: Text("Yes"))
                ],
              )
            ],
          );
        });
  }

  int indexpage = 0;
  List<Widget> wid = [BerandaPage(), CameraPage(), BerandaPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wid[indexpage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          onTap: (value) {
            if (value == 2) {
              value = 0;

              logact(context);
              print("pa");
            }
            setState(() {
              indexpage = value;
            });
          },
          currentIndex: indexpage,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home, color: Colors.grey),
                activeIcon: new Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                label: "Beranda"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.camera, color: Colors.grey),
                activeIcon: new Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                label: "Camera"),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                activeIcon: new Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
                label: "Log Out")
          ]),
    );
  }
}
