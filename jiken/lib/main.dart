import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:jiken/Page%20Utama/Login.dart';
import 'package:jiken/Page%20Utama/Navi.dart';
import 'package:jiken/Provider/KeranPro.dart';
import 'package:jiken/Provider/ShikePro.dart';
import 'package:jiken/Provider/UserPro.dart';
import 'package:jiken/Splash.dart';
import 'package:provider/provider.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelGroupKey: "Basic_Channel_Group",
        channelKey: "Basic_Channel",
        channelName: "Basic_Noti",
        channelDescription: "Jiken Noti")
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: "Basic_Channel_Group", channelGroupName: "Basic_Group")
  ]);
  bool kainoti = await AwesomeNotifications().isNotificationAllowed();
  if (!kainoti) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserPro()),
        ChangeNotifierProvider(create: (context) => KeranPro()),
        ChangeNotifierProvider(create: (context) => ShikePro())
      ],
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)),
          builder: (context, snaps) {
            final dat = Provider.of<UserPro>(context);
            final data = dat.Data;
            if (snaps.connectionState == ConnectionState.waiting) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const Splash(),
              );
            } else {
              if (data.length == 0) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: const LoginPage(),
                );
              } else {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: const NaviPage(),
                );
              }
            }
          }),
    );
  }
}
