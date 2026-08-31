import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/services/notification_service.dart';

import 'core/router/app_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

Future<void> initializeFirebase(ProviderContainer providerContainer) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  final notificationService = providerContainer.read(notificationServiceProvider);
  await notificationService.initialize();

}

Future<void> main() async {
  // Required if you add async initialization (like Firebase or Drift) later
  WidgetsFlutterBinding.ensureInitialized();

  final providerContainer = ProviderContainer();

  try {
    await initializeFirebase(providerContainer);
  } catch(e) {
    print("Failed to initilize Firebase: $e");
  }

  runApp(UncontrolledProviderScope(
          container: providerContainer,
          child: const MyApp()
        )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('Background notification received');
  print('Message ID: ${message.messageId}');
  print('Data: ${message.data}');
}