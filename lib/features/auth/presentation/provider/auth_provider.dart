
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/auth/data/repo/firebase_auth_repo_impl.dart';
import 'package:shopsphere/features/auth/domain/repo/AuthRepo.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => FirebaseAuthRepoImpl());

// Loading state for handling the login & signup during Firebase login/signup
final authControllerProvider = StateProvider<bool>((ref) => false);