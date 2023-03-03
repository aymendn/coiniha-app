import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  UserData({required this.score});
  final int score;

  final auth = FirebaseAuth.instance;
  String? get uid => auth.currentUser?.uid;
  String? get email => auth.currentUser?.email;
  String? get displayName => auth.currentUser?.displayName;
  String? get photoURL => auth.currentUser?.photoURL;

  factory UserData.empty() => UserData(score: 0);
}
