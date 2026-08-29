
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';

class SignupScreen extends StatelessWidget {

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.pop();
                }, icon: Icon(Icons.arrow_back)
            ),
            title: Text('Signup Screen')
        ),
        body: const Center(
            child: Text('Signup Screen')
        )
    );
  }

}