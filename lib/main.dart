import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'services/notification_service.dart';
import 'screens/home_screen.dart';

// Ova funkcija se koristi za rukovanje notifikacijama u pozadini
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Inicijalizacija Firebase-a
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);  // Rukovanje pozadinskim porukama

  // Inicijalizacija NotificationService
  NotificationService notificationService = NotificationService();
  await notificationService.init();

  // Pokretanje aplikacije
  runApp(MyApp(notificationService)); 
}

class MyApp extends StatelessWidget {
  final NotificationService notificationService;

  // Konstruktor koji prima NotificationService
  MyApp(this.notificationService);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shga na denot',
      home: HomeScreen(notificationService),  // Prosljeđivanje NotificationService u HomeScreen
    );
  }
}
