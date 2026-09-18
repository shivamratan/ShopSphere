
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Shivam Ratan',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'shivam@example.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
