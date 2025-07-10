import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/browser.dart';
import 'package:timezone/data/latest.dart';

class Notihomework extends StatefulWidget {
  const Notihomework({super.key});

  @override
  State<Notihomework> createState() => _NotihomeworkState();
}

class _NotihomeworkState extends State<Notihomework> {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    initializeTimeZones();
    setLocalLocation(getLocation('Asia/Dubai'));
    const androidSettings = AndroidInitializationSettings(
      '@mimap/launcher_icon',
    );
    const DarwinInitializationSettings ioSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings, iOS: ioSettings);
    await notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showInstantNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,

      const NotificationDetails(
        android: AndroidNotificationDetails(
          'instant_notification_channel_id',
          'instant Notificatinos',
          priority: Priority.high,
          channelDescription: 'Instant notification channel',
          importance: Importance.max,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Notifiacation ')),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                showInstantNotification(
                  id: 0,
                  title: "notification test",
                  body: 'just test app',
                );
              },
              child: Text('Instant notif'),
            ),
              FilledButton(
              onPressed: () {
                showInstantNotification(
                  id: 0,
                  title: "notification test",
                  body: 'just test app',
                );
              },
              child: Text('Sucduale notif'),
            ),
          ],
        ),
      ),
    );
  }
}
