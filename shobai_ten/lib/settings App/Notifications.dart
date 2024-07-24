import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificai {
  FlutterLocalNotificationsPlugin localnoti = FlutterLocalNotificationsPlugin();
  Future tu() async {
    var initsetand = AndroidInitializationSettings('app_icon');

    var initsett = InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
    );
    await localnoti.initialize(initsett);
  }

  Future<void> shownoti(String title, String body, int id) async {
    var andplatspec = AndroidNotificationDetails("channelId", "channelName",
        importance: Importance.max, priority: Priority.high);

    var platchanspec = NotificationDetails(
      android: andplatspec,
    );
    await localnoti.show(id, title, body, platchanspec);
  }
}
