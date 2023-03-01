import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  const AuthRepository._();

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static User? get user => auth.currentUser;

  static Stream<User?> get authStateChanges => auth.authStateChanges();

  static bool get isAuth => user != null;

  static Future<void> signInWithGoogle({
    required Function(String) onError,
  }) async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await auth.signInWithCredential(credential);
      }
    } catch (error) {
      onError(error.toString());
    }
  }

  static Future<void> signInWithEmail({
    required String email,
    required String password,
    required Function(String) onError,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      onError(error.message!);
    } catch (error) {
      onError(error.toString());
    }
  }

  static Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }
}
