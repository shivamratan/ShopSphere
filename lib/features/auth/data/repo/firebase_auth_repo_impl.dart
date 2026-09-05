
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopsphere/features/auth/domain/repo/AuthRepo.dart';

class FirebaseAuthRepoImpl implements AuthRepo {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRepoImpl({required this._firebaseAuth, required this._googleSignIn});


  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<UserCredential> signInWithEmail({required String email,required String password}) async {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signUpWithEmail({required String email, required String password, required String name}) async {
    final cred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    cred.user?.updateDisplayName(name);
    return cred;
  }



  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn
          .signIn();
      if (googleSignInAccount == null) {
        return null;
      }
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return _firebaseAuth.signInWithCredential(credential);
    } catch(e) {
      print("Google signin error $e");
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

}