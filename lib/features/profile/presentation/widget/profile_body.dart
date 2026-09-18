import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';
import 'package:shopsphere/core/utils/MyFlutterUtils.dart';
import 'package:shopsphere/features/auth/domain/usecase/auth_logout_usecase.dart';
import 'profile_menu_item.dart';

class ProfileBody extends ConsumerStatefulWidget {
  const ProfileBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()  => _ProfileBodyState();


}

class _ProfileBodyState extends ConsumerState<ProfileBody>{

  @override
  Widget build(BuildContext context) {
    final logoutProvider = ref.watch(authLogoutUseCaseProvider);

    return Column(
      children: [
        const Divider(),
        ProfileMenuItem(
          icon: const Text('🛍️', style: TextStyle(fontSize: 20)),
          title: 'My Orders',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: const Text('❤️', style: TextStyle(fontSize: 20)),
          title: 'Wishlist',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: const Text('📍', style: TextStyle(fontSize: 20)),
          title: 'Saved Addresses',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: const Text('💳', style: TextStyle(fontSize: 20)),
          title: 'Payment Methods',
          onTap: () {},
        ),
        const Divider(),
        ProfileMenuItem(
          icon: const Icon(Icons.settings_outlined, color: Colors.black87),
          title: 'Settings',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: const Icon(Icons.notifications_none_outlined, color: Colors.black87),
          title: 'Notifications',
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: const Icon(Icons.help_outline, color: Colors.redAccent),
          title: 'Help & Support',
          onTap: () {},
        ),
        const Divider(),
        ProfileMenuItem(
          icon: const Text('🚪', style: TextStyle(fontSize: 20)),
          title: 'Logout',
          textColor: Colors.black87,
          onTap: () {
            // Implement logout functionality here
            MyFlutterUtils.showAlertDialog(
                context: context,
                title: "Logout",
                content: "Are you sure want to logout ?",
                positiveButtonText: "Confirm",
                negativeButtonText: "Cancel",
                onPositiveButtonClick: () async {
                    await logoutProvider.logout();
                    if (!context.mounted) return;
                    context.go(RouteNames.login);
                },
                onNegativeButtonClick: () {
                    context.pop();
                }
            );
          },
        ),
        const Divider(),
      ],
    );
  }

}
