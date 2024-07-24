import 'package:absensi_pkl/Authentication/LoginPage.dart';
import 'package:absensi_pkl/Provider/LaporanProv.dart';
import 'package:absensi_pkl/Provider/UserProvider.dart';
import 'package:absensi_pkl/SplashScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProv()),
          ChangeNotifierProvider(create: (context) => LaporanProv())
        ],
        child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)),
            builder: (context, napshot) {
              if (napshot.connectionState == ConnectionState.waiting) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true,
                    ),
                    home: SplashScreen());
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: LoginPage(),
                );
              }
            }));
  }
}
