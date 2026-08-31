import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

void fetchFirebaseConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Fetch the FCM registration token
  String? token = await FirebaseMessaging.instance.getToken();
  print("Firebase FCM Token: $token");
}

void main() {
  // Required if you add async initialization (like Firebase or Drift) later
  WidgetsFlutterBinding.ensureInitialized();
  fetchFirebaseConfig();


  runApp(const ProviderScope(
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