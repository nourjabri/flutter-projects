import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  tz.initializeTimeZones();
}

Future<void> scheduleAlarm(DateTime scheduledTime, int id, String title) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    'time for Alarm',
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    tz.TZDateTime.from(scheduledTime, tz.local),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'alarm_channel',
        'Alarms',
        importance: Importance.max,
        priority: Priority.high,
      ),
    ),

    matchDateTimeComponents: DateTimeComponents.time,
  );
}

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });

      final now = DateTime.now();
      final scheduledDate = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      await scheduleAlarm(scheduledDate, 0, 'Alarm'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Alarm')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' Stected Time: ${selectedTime.format(context)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('  Please Selcet time for alarm '),
            ),
          ],
        ),
      ),
    );
  }
}
