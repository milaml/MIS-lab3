import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Prikazivanje lokalne notifikacije
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'joke_channel',
      'Joke Channel',
      channelDescription: 'Shows jokes every day',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Joke of the Day',
      'Here is your joke for today!',
      platformDetails,
      payload: 'joke_payload',
    );
  }

  // Inicijalizacija notifikacija
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
