
import '../model/user.dart';

abstract class FirestoreRepo {

  Future<void> saveUser(User user);

  Future<User?> getUserByEmail(String email);

  Future<User?> getUserById(String userId);

}