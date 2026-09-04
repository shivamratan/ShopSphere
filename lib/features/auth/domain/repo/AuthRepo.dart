
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {

  Stream<User?> get authStateChanges;

  Future<UserCredential> signInWithEmail({required String email,required String password});

  Future<UserCredential> signUpWithEmail({required String email,required String password,required String name});

  Future<UserCredential?> signInWithGoogle();

  Future<void> signOut();

}