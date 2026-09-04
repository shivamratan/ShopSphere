
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/features/auth/data/repo/firebase_auth_repo_impl.dart';
import 'package:shopsphere/features/auth/data/repo/firestore_repo_impl.dart';
import 'package:shopsphere/features/auth/domain/repo/AuthRepo.dart';
import 'package:shopsphere/features/auth/domain/repo/firestore_repo.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => FirebaseAuthRepoImpl());

final fireStoreRepoProvider = Provider<FirestoreRepo>((ref) => FirestoreRepoImpl());

// Loading state for handling the login & signup during Firebase login/signup
final authControllerProvider = StateProvider<bool>((ref) => false);

// Loading state for handling the login & signup during Google login/signup
final googleAuthControllerProvider = StateProvider<bool>((ref) => false);