import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microhack/models/user_data.dart';

class FirestoreRepository {
  const FirestoreRepository._();
  static final firestore = FirebaseFirestore.instance;

  static Future<void> addUser(String id) async {
    await firestore.collection('users').doc(id).set({
      'score': 0,
    });
  }

  static Future<void> updateScore(String id, int score) async {
    await firestore.collection('users').doc(id).update({
      'score': score,
    });
  }

  static Future<UserData> getUserData(String id) async {
    try {
      final snapshot = await firestore.collection('users').doc(id).get();
      final data = snapshot.data() as Map<String, dynamic>;
      return UserData(score: data['score'] ?? 0);
    } catch (error) {
      await addUser(id);
      return UserData.empty();
    }
  }
}
