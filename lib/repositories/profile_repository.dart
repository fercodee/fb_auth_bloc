import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth_bloc/constants/db_constants.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';

import '../models/user_model.dart';

class ProfileRepository {
  final FirebaseFirestore firestore;

  ProfileRepository({
    required this.firestore,
  });

  Future<User> getUser({required String uid}) async {
    try {
      final user = await usersRef.doc(uid).get();
      if (user.exists) {
        return User.fromDoc(user);
      }
      throw 'User not found!';
    } on FirebaseException catch (e) {
      throw CustomError(
        code: e.code,
        message: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        message: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
