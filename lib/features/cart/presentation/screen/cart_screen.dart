import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const Text(
                'Review your items',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Illustration Placeholder
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F9F4), // Very light green/mint circle
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 60,
                        color: Colors.green.shade200,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Looks like you haven\'t added anything\nto your cart yet.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to products or home
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF459468), // Green from the design
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start Shopping',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
