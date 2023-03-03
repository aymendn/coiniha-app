import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/providers/auth.dart';

import '../../core/app_methods.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider.notifier);
    final user = ref.watch(authProvider);
    Future<void> signOut() async {
      await auth.signOut(
        onError: (error) {
          AppMethod.showPopUp(
            context: context,
            title: 'Sign Out Error',
            content: error,
          );
        },
      );
    }

    final int score = user?.score ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Home Screen, score: $score'),
          ),
          FilledButton(
            onPressed: signOut,
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
