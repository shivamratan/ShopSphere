
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopsphere/core/constant/shopsphere_constant.dart';
import 'package:shopsphere/features/auth/domain/model/user.dart';

import '../../domain/repo/firestore_repo.dart';

class FirestoreRepoImpl implements FirestoreRepo {

  final fireStore = FirebaseFirestore.instance;

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      final querySnapshot = await fireStore
          .collection(ShopsphereConstant.FIRESTORE_COLLECTION_USER)
          .where("email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        return User.fromMap(userData);
      }
      return null;
    } catch(e) {
      print(e);
      return null;
    }
  }

  @override
  Future<User?> getUserById(String userId) async {
    try {
      final doc = await fireStore
          .collection(ShopsphereConstant.FIRESTORE_COLLECTION_USER)
          .doc(userId)
          .get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return User.fromMap(doc.data()!);
    } catch (e) {
      print("Error fetching user by ID: $e");
      return null;
    }
  }

  @override
  Future<void> saveUser(User user) {
    return fireStore
        .collection(ShopsphereConstant.FIRESTORE_COLLECTION_USER)
        .doc(user.id)
        .set(user.toMap());
  }





}