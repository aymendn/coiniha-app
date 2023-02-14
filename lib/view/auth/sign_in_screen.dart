import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// sign in screen using hooks and riverpod

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        children: const [Text('hi')],
      ),
    );
  }
}
