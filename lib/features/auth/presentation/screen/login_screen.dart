
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen')
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Login Screen'),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  context.push(RouteNames.signup);
                },
                child: const Text('Signup Screen')
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  context.go(RouteNames.home);
                },
                child: const Text('Home Screen')
            )
          ],
        )
      )
    );
  }

}