import 'package:firebase_messaging/firebase_messaging.dart';

final messagingRef = FirebaseMessaging.instance;

Future<void> setupMessaging() async {
  await messagingRef.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await messagingRef.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  final token = await messagingRef.getToken();
  print('🐯 FCM TOKEN: $token');
}
