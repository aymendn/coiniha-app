import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/models/user_data.dart';
import 'package:microhack/repositories/auth.dart';

import '../repositories/firestore.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, UserData?>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<UserData?> {
  AuthNotifier([UserData? userData]) : super(userData);

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;
  UserData? get userData => state;
  bool get isAuth => user != null;
  String get id => user!.uid;

  void update(UserData? userData) => state = userData;

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required Function(String) onError,
  }) async {
    try {
      await AuthRepository.signInWithEmail(
        email: email,
        password: password,
      );

      state = await FirestoreRepository.getUserData(id);
    } on FirebaseAuthException catch (error) {
      onError(error.message!);
    } catch (error) {
      onError(error.toString());
    }
  }

  Future<void> signInWithGoogle({
    required Function(String) onError,
  }) async {
    try {
      await AuthRepository.signInWithGoogle();
      state = await FirestoreRepository.getUserData(id);

    } on FirebaseAuthException catch (error) {
      onError(error.message!);
    } catch (error) {
      onError(error.toString());
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required Function(String) onError,
  }) async {
    try {
      await AuthRepository.signUpWithEmail(
        email: email,
        password: password,
      );

      await FirestoreRepository.addUser(id);
    } on FirebaseAuthException catch (error) {
      onError(error.message!);
    } catch (error) {
      onError(error.toString());
    }
  }

  Future<void> signOut({required Function(String) onError}) async {
    try {
      await AuthRepository.signOut();
    } on FirebaseAuthException catch (error) {
      onError(error.message!);
    } catch (error) {
      onError(error.toString());
    }
  }
}
