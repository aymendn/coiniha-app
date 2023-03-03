import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/providers/auth.dart';

import '../../core/app_methods.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    final TextEditingController name = useTextEditingController();

    final ValueNotifier<bool> isLoading = useState(false);
    final ValueNotifier<bool> isGoogleLoading = useState(false);
    final ValueNotifier<bool> isSignIn = useState(true);
    // final ValueNotifier<bool> obscureText = useState(true);
    final auth = ref.read(authProvider.notifier);

    // formKey using hooks and useMemoized
    final GlobalKey<FormState> formKey = useMemoized(
      () => GlobalKey<FormState>(),
      [context],
    );

    Future<void> signInWithGoogle() async {
      isGoogleLoading.value = true;
      await auth.signInWithGoogle(
        onError: (error) {
          AppMethod.showPopUp(
            context: context,
            title: 'Sign In Error',
            content: error,
          );
        },
      );
      if (mounted) isGoogleLoading.value = false;
    }

    Future<void> onFormSubmitted() async {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        if (isSignIn.value) {
          await auth.signInWithEmail(
            email: email.text,
            password: password.text,
            onError: (error) {
              AppMethod.showPopUp(
                context: context,
                title: 'Sign In Error',
                content: error,
              );
            },
          );
        } else {
          await auth.signUpWithEmail(
            email: email.text,
            password: password.text,
            name: name.text,
            onError: (error) {
              AppMethod.showPopUp(
                context: context,
                title: 'Sign In Error',
                content: error,
              );
            },
          );
        }
        isLoading.value = false;
      }
    }

    void toggleFormType() {
      formKey.currentState!.reset();
      isSignIn.value = !isSignIn.value;
    }

    final String buttonString = isSignIn.value ? 'Sign In' : 'Sign Up';
    final String toggleString =
        isSignIn.value ? 'Create an account' : 'Sign In';

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!isSignIn.value)
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: isSignIn.value ? AppMethod.nameValidator : null,
                  ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: AppMethod.emailValidator,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: AppMethod.passwordValidator,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size.fromHeight(60),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: onFormSubmitted,
                  child: isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(buttonString),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: toggleFormType,
                  child: isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(toggleString),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: const Size.fromHeight(60),
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: signInWithGoogle,
            child: isGoogleLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Sign In With Google'),
          ),
        ],
      ),
    );
  }
}
