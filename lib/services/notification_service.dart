
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// RiverPod Provider for the NotificationService
final notificationServiceProvider = Provider<NotificationService>((ref) => NotificationService(ref));

class NotificationService {
  final Ref ref;

  NotificationService(this.ref);

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _requestPermission();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);
    await _localNotifications.initialize(settings: initSettings);

    await _getToken();

    _listenToForegroundMessages();
    _listenToNotificationTaps();
    _listenToTokenRefresh();
  }


  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('Notification permission: ${settings.authorizationStatus}',);
  }

  Future<void> _getToken() async {
    final token = await _messaging.getToken();
    print('Token: $token');
  }

  void _listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground notification received');

      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');

      _handleNotifications(message);

    });
  }


  Future<void> _handleNotifications(RemoteMessage message) async {
     final androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'General notifications',
      importance: Importance.high,
      priority: Priority.high,
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: details,
    );
  }

  void _listenToNotificationTaps() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification tapped');
      print('Data: ${message.data}');

      _handleNotification(message);
    });
  }

  void _listenToTokenRefresh() {
    _messaging.onTokenRefresh.listen((token){
      print('FCM Token refreshed: $token');

      // Send updated token to your backend.
    });
  }

  void _handleNotification(RemoteMessage message) {
    print('Notification tapped');
    final type = message.data['type'];

    print('Notification type: $type');
  }

}