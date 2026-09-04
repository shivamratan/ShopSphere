
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupValidationUseCaseProvider = Provider<SignupValidationUseCase>((ref) {
  return SignupValidationUseCase();
});

class SignupValidationUseCase {
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Full name is required";
    }
    if (name.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  String? validateEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email == null || email.isEmpty) {
      return "Email is required";
    } else if (!emailRegex.hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    } else if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }
}
