
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/provider/auth_provider.dart';
import '../repo/AuthRepo.dart';


final authLogoutUseCaseProvider = Provider<AuthLogoutUsecase>((ref) {
  return AuthLogoutUsecase(authRepo: ref.watch(authRepoProvider));
});

class AuthLogoutUsecase {

  final AuthRepo authRepo;

  AuthLogoutUsecase({required this.authRepo});

  Future<void> logout() async {
    await authRepo.signOut();
  }

}