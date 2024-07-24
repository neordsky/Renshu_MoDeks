import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shobai_ten/app/Provider/KeranjangProv.dart';
import 'package:shobai_ten/app/Provider/NotiPro.dart';
import 'package:shobai_ten/app/Provider/PesananProv.dart';
import 'package:shobai_ten/app/Provider/ShikeProv.dart';
import 'package:shobai_ten/app/Provider/TerpesanProv.dart';
import 'package:shobai_ten/app/Provider/UserProv.dart';
import 'package:shobai_ten/app/Splash.dart';
import 'package:shobai_ten/app/modules/home/views/LoginPage.dart';
import 'package:shobai_ten/app/modules/home/views/ScreenUtama/HomePage2.dart';
import 'package:shobai_ten/app/modules/home/views/home_view.dart';
import 'package:provider/provider.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

FlutterLocalNotificationsPlugin localnoti = FlutterLocalNotificationsPlugin();
Future<void> noti() async {
  var initsett = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  );
  await localnoti.initialize(initsett);
}

void main() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool ex = pref.containsKey('Token');
  runApp((ex) ? Splacsh(1) : Splacsh(0));
  noti();
}

class Splacsh extends StatefulWidget {
  int ka = 0;
  Splacsh(this.ka);

  @override
  State<Splacsh> createState() => _SplacshState();
}

class _SplacshState extends State<Splacsh> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KeranjangProv()),
        ChangeNotifierProvider(create: (context) => ShikeProv()),
        ChangeNotifierProvider(create: (context) => NotiPro()),
        ChangeNotifierProvider(create: (context) => UserProv()),
        ChangeNotifierProvider(create: (context) => PeProv()),
        ChangeNotifierProvider(
          create: (context) => TerpesProv(),
        ),
        ChangeNotifierProvider(create: (context) => UserTo())
      ],
      child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          final Data = Provider.of<UserProv>(context);
          final Allda = Data.alldata;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Waiting(),
            );
          } else {
            if (widget.ka == 0) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: AppPages.INITIAL,
                home: LoginPage(),
              );
            } else {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: AppPages.INITIAL,
                home: NavigasiPage(0),
              );
            }
          }
        },
      ),
    );
  }
}
