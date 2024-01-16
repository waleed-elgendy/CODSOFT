import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initLocalNotification() async {
    var androidInitialization =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitialization = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSetting = InitializationSettings(
      android: androidInitialization,
      iOS: iosInitialization,
    );
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) async {});
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      showFirebaseNotification(message);
    });
  }

  notificationDetails({required String channelId, required channelName}) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: "your channel description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker",
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(),
    "High Importance Notification",
    importance: Importance.max,
  );

  Future<void> showFirebaseNotification(RemoteMessage message) async {
    Future.delayed(
      Duration.zero,
      () async {
        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          await notificationDetails(
              channelId: channel.id.toString(),
              channelName: channel.name.toString()),
        );
      },
    );
  }

  Future<void> show() async {
    return Future.delayed(
      Duration(seconds: 6),
      () async {
        _flutterLocalNotificationsPlugin.show(
          0,
          "title",
          "message.notification!.body.toString()",
          await notificationDetails(
              channelId: channel.id.toString(),
              channelName: channel.name.toString()),
        );
      },
    );
  }

  Future<void> scheduleNotification({
    int id = 0,
    required String title,
    required String body,
    String? payLoad,
    required DateTime time,
  }) async {
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(time, tz.local),
      await notificationDetails(
        channelId: channel.id.toString(),
        channelName: channel.name.toString(),
      ),
      payload: payLoad,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
