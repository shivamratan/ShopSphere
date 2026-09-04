
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';
import 'package:shopsphere/core/utils/MyFlutterUtils.dart';
import 'package:shopsphere/features/auth/presentation/widget/custom_auth_text_field.dart';

import '../../domain/usecase/login_validation_usecase.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();


  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validationUseCase = ref.watch(loginUseCaseProvider);
    final isLoading = ref.watch(authControllerProvider);
    final isGoogleAuthLoading = ref.watch(googleAuthControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
           Form (
            key: _formKey,
            child: SingleChildScrollView (
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/shopsphere_logo.png',
                          height: 100,
                          width: 100,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.shopping_bag, size: 100, color: Colors.blueAccent),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'ShopSphere',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomAuthTextField(
                    controller: _emailController,
                    hintText: 'Enter Your Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => validationUseCase.validateEmail(value),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomAuthTextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    hintText: 'Enter Your Password',
                    validator: (value) => validationUseCase.validatePassword(value),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xFF4A80B4),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        MyFlutterUtils.showSnackBar(context, 'Forgot Password?');
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF4A80B4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () async {
                        try {
                          ref.read(authControllerProvider.notifier).state = true;

                          // Triggering the validation check before making call
                          if (_formKey.currentState!.validate()) {
                            await ref.read(authRepoProvider).signInWithEmail(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            if (context.mounted) {
                              context.go(RouteNames.home);
                              MyFlutterUtils.showSnackBar(
                                  context, 'Login Successful');
                            }
                          }
                        } catch(e) {
                          MyFlutterUtils.showSnackBar(context, e.toString());
                        } finally {
                          ref.read(authControllerProvider.notifier).state = false;
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A80B4),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: isLoading ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.blueAccent,
                          strokeWidth: 2,
                        ),
                      ) : const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: IconButton(
                        onPressed: isGoogleAuthLoading ? null : () async {

                          try {
                            ref.watch(googleAuthControllerProvider.notifier).state = true;

                            final userCredential = await ref.read(authRepoProvider).signInWithGoogle();
                            ref.watch(googleAuthControllerProvider.notifier).state = false;

                            if (userCredential != null) {
                              if (context.mounted) {
                                context.go(RouteNames.home);
                                MyFlutterUtils.showSnackBar(
                                    context, 'Google LogIn Successful');
                              }
                            }
                          } catch(e) {
                            print("the error is $e");
                            ref.watch(googleAuthControllerProvider.notifier).state = false;
                            if (mounted) {
                              MyFlutterUtils.showSnackBar(context, e.toString());
                            }
                          }
                        },
                        icon: Image.network(
                          'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      TextButton(
                        onPressed: () {
                            context.push(RouteNames.signup);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A80B4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
            isGoogleAuthLoading ? Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 5,
                ),
              ),
            ) : Container()
          ],
        )
      ),
    );
  }
}
