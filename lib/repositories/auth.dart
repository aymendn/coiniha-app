import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  const AuthRepository._();
  static final auth = FirebaseAuth.instance;
  static User? get user => auth.currentUser;
  static bool get isAuth => user != null;

  static Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
      
    );

    if(name != null) await auth.currentUser!.updateDisplayName(name);
  }

  static Future<void> signInWithGoogle() async {
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
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }
}
