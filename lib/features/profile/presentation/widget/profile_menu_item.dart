import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;
  final Color? textColor;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
