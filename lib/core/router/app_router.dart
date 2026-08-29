
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';
import 'package:shopsphere/features/auth/presentation/screen/login_screen.dart';
import 'package:shopsphere/features/auth/presentation/screen/signup_screen.dart';

import '../../features/home/presentation/screen/home_screen.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(path: RouteNames.splash,
              builder: (context, state) {
                return const LoginScreen();
              },
      ),
      GoRoute(path: RouteNames.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),

      GoRoute(path: RouteNames.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(path: RouteNames.signup,
        builder: (context, state) {
          return const SignupScreen();
        },
      ),

    ]

);