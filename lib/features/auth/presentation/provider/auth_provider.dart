
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopsphere/features/auth/data/repo/firebase_auth_repo_impl.dart';
import 'package:shopsphere/features/auth/data/repo/firestore_repo_impl.dart';
import 'package:shopsphere/features/auth/domain/repo/AuthRepo.dart';
import 'package:shopsphere/features/auth/domain/repo/firestore_repo.dart';


final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final googleSignInProvider = Provider<GoogleSignIn>((ref) => GoogleSignIn());
final fireStoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final authRepoProvider = Provider<AuthRepo>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final googleSignIn = ref.watch(googleSignInProvider);
  return FirebaseAuthRepoImpl(firebaseAuth: firebaseAuth, googleSignIn: googleSignIn);
});

final fireStoreRepoProvider = Provider<FirestoreRepo>((ref) => FirestoreRepoImpl(fireStore: ref.watch(fireStoreProvider)));

// Loading state for handling the login & signup during Firebase login/signup
final authControllerProvider = StateProvider<bool>((ref) => false);

// Loading state for handling the login & signup during Google login/signup
final googleAuthControllerProvider = StateProvider<bool>((ref) => false);