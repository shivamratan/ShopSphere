
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/core/utils/MyFlutterUtils.dart';

class DashboardHeader extends ConsumerWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ShopSphere', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                          MyFlutterUtils.showSnackBar(context, "Notification Clicked");
                      },
                      icon: Icon(Icons.notifications_sharp),
                      color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      MyFlutterUtils.showSnackBar(context, "Notification Clicked");
                    },
                    icon: Icon(Icons.person),
                    color: Colors.black,
                  ),
                ],
              )

            ],
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search Product...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }
}