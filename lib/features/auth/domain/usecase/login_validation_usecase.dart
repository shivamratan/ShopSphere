import 'package:flutter_riverpod/flutter_riverpod.dart';


final loginUseCaseProvider = Provider<LoginValidationUsecase>((ref) {
  return LoginValidationUsecase();
});


class LoginValidationUsecase {

    String? validateEmail(String? email) {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (email == null || email.isEmpty) {
        return "Email is required";
      } else if (!emailRegex.hasMatch(email)) {
        return "Please enter valid email address";
      }
      return null;
    }

    String? validatePassword(String? password) {
      if (password == null || password.isEmpty) {
        return "Password is required";
      } else if (password.length < 6) {
        return "Password must be at least 8 characters long";
      }
      return null;
    }
}