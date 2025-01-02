import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  final NotificationService notificationService;

  HomeScreen(this.notificationService);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.notificationService.init();  
    getToken();
  }

  void getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("FCM Token: $token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213021 Joke App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to the Joke App!'),
            ElevatedButton(
              onPressed: () {
                widget.notificationService.showNotification();  
              },
              child: Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }
}

