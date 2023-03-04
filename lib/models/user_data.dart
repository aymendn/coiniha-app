// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  UserData({
    required this.score,
    String? displayName,
    String? email,
    String? photoURL,
  }) {
    _name = displayName;
    _email = email;
    _photoURL = photoURL;
  }
  final int score;
  String? _name;
  String? _email;
  String? _photoURL;

  final auth = FirebaseAuth.instance;
  String? get uid => _name != null ? " " : auth.currentUser?.uid;
  String? get email => _email ?? auth.currentUser?.email;
  String? get displayName => _name ?? auth.currentUser?.displayName;
  String? get photoURL => _photoURL ?? auth.currentUser?.photoURL;

  factory UserData.empty() => UserData(score: 0);
}
